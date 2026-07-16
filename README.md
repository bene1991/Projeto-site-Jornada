# Jornada360 — Site de Promoções

Vitrine de promoções de viagem da **Jornada360** com painel de administração, gerador de artes e dados na nuvem (Supabase).

## Estrutura
- `index.html` — o site completo (público + painel admin + editor de arte)
- `supabase-schema.sql` — esquema do banco (rodar uma vez no Supabase)
- `DEPLOY.md` — passo a passo de publicação
- `jornada360-promocoes.html` — protótipo antigo (localStorage), só referência

## Configuração
No topo do `index.html`, preencha suas chaves do Supabase:
```js
const SUPABASE_URL = 'https://SEU-PROJETO.supabase.co';
const SUPABASE_ANON_KEY = 'SUA-CHAVE-ANON-PUBLIC';
```

## Publicação
Site estático — publique na Vercel. Instruções completas em [`DEPLOY.md`](DEPLOY.md).

Feito com ♥ para a Jornada360.
