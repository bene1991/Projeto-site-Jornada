-- ============================================================
-- Jornada360 · Esquema do Supabase
-- Cole tudo isto no Supabase → SQL Editor → New query → Run
-- ============================================================

-- 1) Configurações do site (uma linha só)
create table if not exists settings (
  id   int primary key default 1,
  data jsonb not null default '{}'::jsonb
);
insert into settings (id, data) values (1, '{}'::jsonb)
  on conflict (id) do nothing;

-- 2) Promoções
create table if not exists promos (
  id         bigint primary key,
  data       jsonb not null,
  pos        int   not null default 0,
  created_at timestamptz not null default now()
);

-- 3) Biblioteca de imagens por destino (reuso automático)
create table if not exists destinations (
  name      text primary key,   -- nome do destino em minúsculas
  image_url text
);

-- ============================================================
-- Segurança (RLS): todo mundo LÊ, só logado ESCREVE
-- ============================================================
alter table settings     enable row level security;
alter table promos       enable row level security;
alter table destinations enable row level security;

-- leitura pública
create policy "public read settings"     on settings     for select using (true);
create policy "public read promos"       on promos       for select using (true);
create policy "public read destinations" on destinations for select using (true);

-- escrita só para usuário autenticado (o admin)
create policy "auth write settings"     on settings     for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "auth write promos"       on promos       for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "auth write destinations" on destinations for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

-- ============================================================
-- Storage: bucket público "images"
-- ============================================================
insert into storage.buckets (id, name, public)
values ('images', 'images', true)
on conflict (id) do nothing;

create policy "public read images"  on storage.objects for select using (bucket_id = 'images');
create policy "auth upload images"  on storage.objects for insert with check (bucket_id = 'images' and auth.role() = 'authenticated');
create policy "auth update images"  on storage.objects for update using (bucket_id = 'images' and auth.role() = 'authenticated');
create policy "auth delete images"  on storage.objects for delete using (bucket_id = 'images' and auth.role() = 'authenticated');
