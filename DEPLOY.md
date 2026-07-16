# 🚀 Publicar o site da Jornada360 (Supabase + Vercel)

Você vai fazer 3 coisas: criar o banco (Supabase), colocar as chaves no site, e publicar (Vercel).
Tempo: ~20 minutos. Não precisa saber programar.

---

## PARTE 1 — Supabase (banco + fotos) — GRÁTIS

1. Acesse **https://supabase.com** → **Start your project** → entre com o Google/GitHub.
2. **New project** → dê um nome (ex: `jornada360`), crie uma senha do banco (guarde) e escolha a região **South America (São Paulo)**. Clique **Create new project** e espere ~2 min.
3. No menu lateral, abra **SQL Editor** → **New query**.
4. Abra o arquivo **`supabase-schema.sql`** (que está nesta pasta), copie **TODO** o conteúdo, cole no editor e clique **Run**. Deve aparecer "Success".
5. Pegue suas chaves: menu **Project Settings** (engrenagem) → **API**:
   - **Project URL** (ex: `https://abcdxyz.supabase.co`)
   - **anon public** (uma chave longa)
   Deixe essa aba aberta, vamos usar na Parte 2.

### Criar o seu login de administrador
6. Menu **Authentication** → **Users** → **Add user** → **Create new user**.
   - E-mail: o seu e-mail
   - Password: uma senha forte
   - Marque **Auto Confirm User** (importante!)
   - **Create user**
   > Esse é o e-mail/senha que você vai usar no cadeado 🔒 do site.

---

## PARTE 2 — Colocar as chaves no site

1. Abra o arquivo **`index.html`** num editor de texto.
2. Bem no começo, ache estas duas linhas e troque pelos seus valores da Parte 1 (passo 5):

```js
const SUPABASE_URL = 'https://SEU-PROJETO.supabase.co';
const SUPABASE_ANON_KEY = 'SUA-CHAVE-ANON-PUBLIC';
```

3. (Opcional, SEO) Procure por `SEU-DOMINIO.com.br` no arquivo e troque pelo seu domínio, se tiver.
4. Salve o arquivo.

> A chave `anon public` pode ficar visível no site — é feita pra isso. Quem protege os dados são as regras (RLS) que o SQL já criou: o público só **lê**, só você (logado) **escreve**.

---

## PARTE 3 — Publicar na Vercel — GRÁTIS

Escolha **uma** das opções:

### Opção A — Arrastar (mais fácil, sem GitHub)
1. Acesse **https://vercel.com** → entre com Google/GitHub.
2. Clique em **Add New → Project → Deploy** (ou use **https://vercel.com/new**).
3. Se pedir, use a opção de subir uma pasta e **arraste esta pasta inteira** (com o `index.html` dentro).
4. **Deploy** → em segundos você recebe um link tipo `jornada360.vercel.app`. Pronto! 🎉

### Opção B — GitHub (melhor pra atualizar depois)
1. Crie um repositório no **https://github.com** e suba os arquivos desta pasta.
2. Na Vercel: **Add New → Project → Import** o repositório → **Deploy**.
3. Toda vez que você mudar algo e der "push" no GitHub, a Vercel republica sozinha.

### Opção C — Terminal (Vercel CLI)
```bash
npm i -g vercel
cd "Projeto site Jornada"
vercel
```
Siga as perguntas (aceite os padrões).

### Domínio próprio (opcional)
Na Vercel: projeto → **Settings → Domains** → adicione seu domínio (ex: `jornada360.com.br`) e siga as instruções de DNS.

---

## ✅ Testando
1. Abra o link da Vercel.
2. Clique no cadeado 🔒 → entre com o e-mail/senha que você criou no Supabase.
3. Cadastre uma promoção com foto → ela some do formulário e **aparece no site** (agora salva na nuvem, some nunca mais).
4. Abra o site em outro celular → as promoções aparecem pra qualquer pessoa. É esse link que você manda pros clientes.

## 🔁 Reuso de foto por destino (já incluso)
Quando você cadastra uma promo com foto de um destino, a foto fica **guardada para aquele destino**.
Da próxima vez que você criar outra promo e digitar o mesmo destino, a foto é **puxada automaticamente** — não precisa subir de novo.

## Precisa de ajuda?
Se algo não salvar, quase sempre é: (a) chaves erradas na Parte 2, ou (b) esqueceu de marcar **Auto Confirm User** no admin. Me chama que a gente resolve.
