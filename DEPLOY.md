# 🚀 Guia de Deployment

Este documento fornece instruções para fazer deploy do **Treinamento de Engenharia de Prompt** em diferentes plataformas.

## 📋 Pré-requisitos

- Projeto clonado e testado localmente (`pnpm dev` funcionando)
- Build gerado com sucesso (`pnpm build`)
- Conta em pelo menos uma plataforma de hosting

---

## 🌐 Opção 1: Vercel (Recomendado)

Vercel é a plataforma oficial do criador do Next.js/Vite e oferece deploy automático.

### Passo 1: Criar Conta

1. Visite [vercel.com](https://vercel.com)
2. Clique em "Sign Up"
3. Escolha "Continue with GitHub"
4. Autorize a integração

### Passo 2: Importar Projeto

1. No dashboard do Vercel, clique em "New Project"
2. Selecione o repositório do GitHub
3. Clique em "Import"

### Passo 3: Configurar Variáveis de Ambiente

1. Vá para "Settings" → "Environment Variables"
2. Adicione variáveis se necessário (geralmente não é necessário para este projeto)
3. Clique em "Save"

### Passo 4: Deploy

1. Clique em "Deploy"
2. Aguarde o build completar (2-3 minutos)
3. Acesse o URL fornecido

**URL padrão:** `https://seu-projeto.vercel.app`

### Deploy Automático

Após a primeira configuração, qualquer push para `main` fará deploy automático!

---

## 🎨 Opção 2: Netlify

Netlify oferece uma interface visual intuitiva e suporte a formulários.

### Passo 1: Criar Conta

1. Visite [netlify.com](https://www.netlify.com)
2. Clique em "Sign up"
3. Escolha "GitHub"
4. Autorize a integração

### Passo 2: Conectar Repositório

1. Clique em "New site from Git"
2. Escolha "GitHub"
3. Selecione o repositório
4. Clique em "Connect & authorize"

### Passo 3: Configurar Build

1. **Build command:** `pnpm build`
2. **Publish directory:** `dist`
3. Clique em "Deploy site"

### Passo 4: Configurar Domínio (Opcional)

1. Vá para "Site settings" → "Domain management"
2. Clique em "Add custom domain"
3. Siga as instruções

**URL padrão:** `https://seu-site.netlify.app`

---

## 📄 Opção 3: GitHub Pages

Grátis e integrado com GitHub, mas com algumas limitações.

### Passo 1: Configurar Vite

Edite `vite.config.ts`:

```typescript
export default defineConfig({
  plugins: [react()],
  base: '/treinamento-prompt-sebrae/', // Adicione esta linha
});
```

### Passo 2: Criar GitHub Actions Workflow

Crie `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '22'
        cache: 'pnpm'
    
    - name: Install pnpm
      uses: pnpm/action-setup@v2
      with:
        version: 10.4.1
    
    - name: Install dependencies
      run: pnpm install
    
    - name: Build
      run: pnpm build
    
    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./dist
```

### Passo 3: Ativar GitHub Pages

1. Vá para "Settings" → "Pages"
2. Em "Source", selecione "Deploy from a branch"
3. Selecione branch `gh-pages`
4. Clique em "Save"

**URL:** `https://seu-usuario.github.io/treinamento-prompt-sebrae`

---

## 🐳 Opção 4: Docker + Qualquer Servidor

Para máximo controle, use Docker.

### Passo 1: Criar Dockerfile

```dockerfile
# Build stage
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install
COPY . .
RUN pnpm build

# Production stage
FROM node:22-alpine
WORKDIR /app
RUN npm install -g serve
COPY --from=builder /app/dist ./dist
EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
```

### Passo 2: Build da Imagem

```bash
docker build -t treinamento-prompt:latest .
```

### Passo 3: Deploy em Servidor

```bash
# SSH para seu servidor
ssh user@seu-servidor.com

# Pull da imagem
docker pull seu-registry/treinamento-prompt:latest

# Run do container
docker run -d \
  --name treinamento-prompt \
  -p 80:3000 \
  --restart unless-stopped \
  seu-registry/treinamento-prompt:latest
```

---

## ☁️ Opção 5: AWS S3 + CloudFront

Para máxima performance e escalabilidade.

### Passo 1: Criar Bucket S3

```bash
aws s3 mb s3://treinamento-prompt-sebrae
```

### Passo 2: Build Local

```bash
pnpm build
```

### Passo 3: Upload para S3

```bash
aws s3 sync dist/ s3://treinamento-prompt-sebrae --delete
```

### Passo 4: Criar CloudFront Distribution

1. Vá para CloudFront no AWS Console
2. Clique em "Create distribution"
3. Selecione o bucket S3
4. Configure as opções
5. Clique em "Create distribution"

---

## 🔧 Opção 6: Railway

Plataforma moderna com suporte a Docker.

### Passo 1: Criar Conta

1. Visite [railway.app](https://railway.app)
2. Clique em "Start Project"
3. Escolha "Deploy from GitHub"

### Passo 2: Conectar Repositório

1. Autorize o GitHub
2. Selecione o repositório
3. Clique em "Deploy"

### Passo 3: Configurar

Railway detectará automaticamente o tipo de projeto e configurará.

---

## 🎯 Opção 7: Render

Alternativa gratuita ao Heroku.

### Passo 1: Criar Conta

1. Visite [render.com](https://render.com)
2. Clique em "Sign up with GitHub"
3. Autorize a integração

### Passo 2: Criar Novo Serviço

1. Clique em "New +"
2. Escolha "Web Service"
3. Conecte seu repositório GitHub

### Passo 3: Configurar

- **Build Command:** `pnpm install && pnpm build`
- **Start Command:** `pnpm preview`
- Clique em "Create Web Service"

---

## 📊 Comparação de Plataformas

| Plataforma | Preço | Performance | Facilidade | Suporte |
|-----------|-------|-------------|-----------|---------|
| Vercel | Free/Pago | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Excelente |
| Netlify | Free/Pago | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Bom |
| GitHub Pages | Grátis | ⭐⭐⭐ | ⭐⭐⭐ | Comunidade |
| AWS | Pago | ⭐⭐⭐⭐⭐ | ⭐⭐ | Excelente |
| Railway | Free/Pago | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Bom |
| Render | Free/Pago | ⭐⭐⭐ | ⭐⭐⭐⭐ | Bom |

---

## 🔐 Segurança

### HTTPS

Todas as plataformas mencionadas oferecem HTTPS automático. ✅

### Variáveis de Ambiente

Se precisar de variáveis secretas:

```bash
# Vercel
vercel env add VARIAVEL_SECRETA

# Netlify
# Settings → Build & deploy → Environment

# GitHub Pages
# Settings → Secrets and variables → Actions
```

### Headers de Segurança

Adicione em `vite.config.ts`:

```typescript
export default defineConfig({
  server: {
    headers: {
      'X-Content-Type-Options': 'nosniff',
      'X-Frame-Options': 'DENY',
      'X-XSS-Protection': '1; mode=block',
    },
  },
});
```

---

## 📈 Monitoramento

### Vercel Analytics

```bash
# Adicione ao package.json
npm install @vercel/analytics
```

### Netlify Analytics

Ativado automaticamente no painel.

### Google Analytics

Adicione ao `index.html`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_ID');
</script>
```

---

## 🚨 Troubleshooting

### Build falha com "pnpm not found"

```bash
# Adicione ao package.json
"engines": {
  "node": ">=22.0.0",
  "pnpm": ">=10.0.0"
}
```

### Página branca após deploy

1. Verifique o console do navegador (F12)
2. Verifique os logs do servidor
3. Limpe cache do navegador (Ctrl+Shift+Delete)

### Estilos não carregam

Verifique se o `base` em `vite.config.ts` está correto para GitHub Pages.

### Imagens não aparecem

Verifique se as URLs das imagens estão corretas (caminhos relativos vs. absolutos).

---

## 📝 Checklist de Deploy

- [ ] Build local funciona (`pnpm build`)
- [ ] Sem erros TypeScript (`pnpm check`)
- [ ] Testado em múltiplos navegadores
- [ ] Variáveis de ambiente configuradas
- [ ] HTTPS ativado
- [ ] Analytics configurado
- [ ] Domínio customizado (se aplicável)
- [ ] Backups configurados
- [ ] Monitoramento ativado

---

## 🎓 Próximos Passos

1. **Configurar Domínio Customizado:** Aponte seu domínio para a plataforma
2. **Ativar Analytics:** Monitore o tráfego
3. **Configurar CI/CD:** Automatize deploys
4. **Backup:** Configure backups automáticos
5. **Monitoramento:** Ative alertas de erro

---

## 📞 Suporte

- **Vercel:** [vercel.com/support](https://vercel.com/support)
- **Netlify:** [netlify.com/support](https://netlify.com/support)
- **GitHub Pages:** [docs.github.com/pages](https://docs.github.com/pages)
- **AWS:** [aws.amazon.com/support](https://aws.amazon.com/support)

---

**Última atualização:** 13 de maio de 2025
