# 📤 Guia Completo: Publicar no GitHub

Este documento fornece um guia passo a passo para publicar o **Treinamento de Engenharia de Prompt** no GitHub.

---

## 🎯 Visão Geral

Você aprenderá a:
1. Criar um repositório no GitHub
2. Fazer upload de todos os arquivos
3. Configurar o repositório
4. Ativar GitHub Pages (opcional)
5. Configurar CI/CD automático

**Tempo estimado:** 15-20 minutos

---

## 📋 Pré-requisitos

- Conta GitHub (crie em [github.com](https://github.com) se não tiver)
- Git instalado localmente
- Projeto clonado e testado

---

## 🚀 Passo 1: Criar Repositório no GitHub

### 1.1 Acessar GitHub

1. Vá para [github.com](https://github.com)
2. Clique no ícone **+** no canto superior direito
3. Selecione **"New repository"**

### 1.2 Configurar Repositório

Preencha os campos:

| Campo | Valor |
|-------|-------|
| Repository name | `treinamento-prompt-sebrae` |
| Description | `Treinamento corporativo interativo sobre Engenharia de Prompt` |
| Visibility | **Public** (para que todos possam acessar) |
| Initialize with | ❌ Não marque (você já tem arquivos locais) |

### 1.3 Criar Repositório

Clique em **"Create repository"**

---

## 📤 Passo 2: Fazer Upload dos Arquivos

### 2.1 Configurar Git Localmente

Abra o terminal na pasta do projeto:

```bash
cd ~/projetos/treinamento-prompt-sebrae
```

### 2.2 Inicializar Git (se não estiver já)

```bash
# Verificar se já tem git
git status

# Se não tiver, inicialize
git init
```

### 2.3 Adicionar Remote do GitHub

Copie o comando do GitHub (ele mostrará algo como):

```bash
git remote add origin https://github.com/seu-usuario/treinamento-prompt-sebrae.git
```

Verifique se foi adicionado:

```bash
git remote -v
```

Esperado:
```
origin  https://github.com/seu-usuario/treinamento-prompt-sebrae.git (fetch)
origin  https://github.com/seu-usuario/treinamento-prompt-sebrae.git (push)
```

### 2.4 Fazer Commit Inicial

```bash
# Adicionar todos os arquivos
git add .

# Criar commit
git commit -m "Initial commit: Treinamento Engenharia de Prompt"

# Verificar status
git status
```

### 2.5 Fazer Push para GitHub

```bash
# Push para a branch main
git branch -M main
git push -u origin main
```

Aguarde alguns segundos. Você verá algo como:

```
Enumerating objects: 150, done.
Counting objects: 100% (150/150), done.
Delta compression using up to 8 threads
Compressing objects: 100% (120/120), done.
Writing objects: 100% (150/150), 2.5 MB, done.
Total 150 (delta 45), reused 0 (delta 0), pack-reused 0
To https://github.com/seu-usuario/treinamento-prompt-sebrae.git
 * [new branch]      main -> main
Branch 'main' set to track remote branch 'main' from 'origin'.
```

✅ **Sucesso!** Seus arquivos estão no GitHub!

---

## 🔧 Passo 3: Configurar Repositório

### 3.1 Adicionar Descrição

1. Vá para o repositório no GitHub
2. Clique em **"Edit"** (ícone de lápis)
3. Adicione:
   - **Description:** "Treinamento corporativo interativo sobre Engenharia de Prompt"
   - **Website:** (deixe em branco por enquanto)
   - **Topics:** `prompt-engineering`, `ai-training`, `sebrae`, `education`

### 3.2 Configurar Branches

1. Vá para **"Settings"** → **"Branches"**
2. Em "Default branch", selecione **"main"**
3. Clique em **"Update"**

### 3.3 Adicionar Colaboradores (Opcional)

1. Vá para **"Settings"** → **"Collaborators"**
2. Clique em **"Add people"**
3. Digite o nome de usuário do GitHub
4. Selecione a permissão (Maintain, Push, Pull)

---

## 🌐 Passo 4: Ativar GitHub Pages (Opcional)

Se quiser que o site seja acessível via GitHub Pages:

### 4.1 Configurar Vite

Edite `vite.config.ts`:

```typescript
export default defineConfig({
  plugins: [react()],
  base: '/treinamento-prompt-sebrae/', // Adicione esta linha
});
```

### 4.2 Criar GitHub Actions Workflow

1. Crie a pasta `.github/workflows/` (se não existir)
2. Crie o arquivo `.github/workflows/deploy.yml`
3. Cole o conteúdo (veja [.github_workflows_deploy.yml](.github_workflows_deploy.yml))

### 4.3 Fazer Push

```bash
git add .github/
git commit -m "Add GitHub Pages deployment workflow"
git push origin main
```

### 4.4 Ativar GitHub Pages

1. Vá para **"Settings"** → **"Pages"**
2. Em "Source", selecione **"Deploy from a branch"**
3. Selecione branch **"gh-pages"**
4. Clique em **"Save"**

Aguarde 2-3 minutos. Seu site estará em:
```
https://seu-usuario.github.io/treinamento-prompt-sebrae
```

---

## 🤖 Passo 5: Configurar CI/CD Automático

### 5.1 Verificar Workflow

1. Vá para **"Actions"** no repositório
2. Você deve ver o workflow sendo executado
3. Aguarde completar (geralmente 5-10 minutos)

### 5.2 Verificar Status

- ✅ Verde = Deploy bem-sucedido
- ❌ Vermelho = Erro (clique para ver detalhes)

### 5.3 Configurar Secrets (se necessário)

Se usar Vercel ou Netlify:

1. Vá para **"Settings"** → **"Secrets and variables"** → **"Actions"**
2. Clique em **"New repository secret"**
3. Adicione:
   - `VERCEL_TOKEN` (se usar Vercel)
   - `NETLIFY_AUTH_TOKEN` (se usar Netlify)

---

## 📊 Passo 6: Verificar Tudo

### 6.1 Checklist

- [ ] Repositório criado
- [ ] Arquivos fazendo push com sucesso
- [ ] README.md visível na página inicial
- [ ] GitHub Pages ativado (se desejado)
- [ ] Workflow executando sem erros
- [ ] Site acessível

### 6.2 URLs Importantes

| Recurso | URL |
|---------|-----|
| Repositório | `https://github.com/seu-usuario/treinamento-prompt-sebrae` |
| GitHub Pages | `https://seu-usuario.github.io/treinamento-prompt-sebrae` |
| Issues | `https://github.com/seu-usuario/treinamento-prompt-sebrae/issues` |
| Pull Requests | `https://github.com/seu-usuario/treinamento-prompt-sebrae/pulls` |
| Releases | `https://github.com/seu-usuario/treinamento-prompt-sebrae/releases` |

---

## 🔄 Passo 7: Fluxo de Trabalho Contínuo

### 7.1 Fazer Mudanças Localmente

```bash
# Criar nova branch para feature
git checkout -b feature/nova-funcionalidade

# Fazer mudanças nos arquivos
# ...

# Adicionar e fazer commit
git add .
git commit -m "feat: adicionar nova funcionalidade"

# Fazer push
git push origin feature/nova-funcionalidade
```

### 7.2 Abrir Pull Request

1. Vá para o repositório no GitHub
2. Clique em **"Compare & pull request"**
3. Adicione descrição
4. Clique em **"Create pull request"**

### 7.3 Merge para Main

Após aprovação:

1. Clique em **"Merge pull request"**
2. Clique em **"Confirm merge"**
3. O workflow será acionado automaticamente

---

## 📝 Passo 8: Documentação Importante

Certifique-se de que estes arquivos estão no repositório:

- ✅ `README.md` — Descrição geral do projeto
- ✅ `INSTALL.md` — Como instalar localmente
- ✅ `CONTRIBUTING.md` — Como contribuir
- ✅ `DEPLOY.md` — Como fazer deploy
- ✅ `LICENSE` — Licença CC BY 4.0
- ✅ `.gitignore` — Arquivos ignorados
- ✅ `package.json` — Dependências

---

## 🎯 Passo 9: Adicionar Badges ao README

Adicione ao início do `README.md`:

```markdown
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![GitHub stars](https://img.shields.io/github/stars/seu-usuario/treinamento-prompt-sebrae.svg)](https://github.com/seu-usuario/treinamento-prompt-sebrae/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/seu-usuario/treinamento-prompt-sebrae.svg)](https://github.com/seu-usuario/treinamento-prompt-sebrae/network)
[![GitHub issues](https://img.shields.io/github/issues/seu-usuario/treinamento-prompt-sebrae.svg)](https://github.com/seu-usuario/treinamento-prompt-sebrae/issues)
```

---

## 🚨 Troubleshooting

### Erro: "fatal: remote origin already exists"

```bash
# Remova o remote existente
git remote remove origin

# Adicione novamente
git remote add origin https://github.com/seu-usuario/treinamento-prompt-sebrae.git
```

### Erro: "Permission denied (publickey)"

```bash
# Gere uma chave SSH
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Adicione a chave ao GitHub
# Settings → SSH and GPG keys → New SSH key
```

### Erro: "Updates were rejected"

```bash
# Puxe as mudanças remotas
git pull origin main

# Resolva conflitos se houver
# Depois faça push novamente
git push origin main
```

### Workflow não executa

1. Verifique se `.github/workflows/deploy.yml` existe
2. Verifique se o arquivo está no branch `main`
3. Vá para **"Actions"** e verifique os logs

---

## 📈 Próximas Etapas

### Aumentar Visibilidade

1. **Adicionar Topics:** Settings → Topics (prompt-engineering, ai, education)
2. **Criar Releases:** Vá para "Releases" → "Create a new release"
3. **Adicionar Wiki:** Settings → Features → Wiki
4. **Ativar Discussions:** Settings → Features → Discussions

### Melhorar Documentação

1. Criar arquivo `ARCHITECTURE.md` explicando a estrutura
2. Criar arquivo `FAQ.md` com perguntas frequentes
3. Criar arquivo `CHANGELOG.md` com histórico de versões
4. Adicionar exemplos em `examples/`

### Automação Avançada

1. Configurar Branch Protection Rules
2. Adicionar Code Owners (CODEOWNERS)
3. Configurar Dependabot para atualizações automáticas
4. Adicionar templates para Issues e PRs

---

## 🎓 Recursos Úteis

- [GitHub Docs](https://docs.github.com)
- [GitHub Pages Guide](https://pages.github.com)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Git Cheat Sheet](https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf)

---

## ✅ Checklist Final

- [ ] Repositório criado no GitHub
- [ ] Todos os arquivos fazendo push com sucesso
- [ ] README.md visível e bem formatado
- [ ] CONTRIBUTING.md e INSTALL.md presentes
- [ ] LICENSE adicionada
- [ ] GitHub Pages ativado (opcional)
- [ ] Workflow CI/CD configurado
- [ ] Badges adicionadas ao README
- [ ] Descrição e topics adicionados
- [ ] Colaboradores convidados (se aplicável)

---

## 🎉 Parabéns!

Seu projeto está agora no GitHub e pronto para colaboração! 🚀

Para mais informações, veja:
- [README.md](README_GITHUB.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [DEPLOY.md](DEPLOY.md)

---

**Última atualização:** 13 de maio de 2025
