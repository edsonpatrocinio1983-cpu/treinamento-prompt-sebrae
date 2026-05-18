# 📦 Guia de Instalação Detalhado

Este documento fornece instruções passo a passo para instalar e configurar o **Treinamento de Engenharia de Prompt** em diferentes ambientes.

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

| Ferramenta | Versão Mínima | Versão Recomendada | Como Instalar |
|-----------|----------------|-------------------|----------------|
| Node.js | 18.0.0 | 22.13.0 | [nodejs.org](https://nodejs.org) |
| npm | 9.0.0 | 10.0.0+ | Incluído com Node.js |
| pnpm | 8.0.0 | 10.4.1+ | `npm install -g pnpm` |
| Git | 2.30.0 | 2.40.0+ | [git-scm.com](https://git-scm.com) |

### Verificar Instalação

```bash
# Verificar Node.js
node --version
# v22.13.0

# Verificar npm
npm --version
# 10.2.4

# Verificar pnpm
pnpm --version
# 10.4.1

# Verificar Git
git --version
# git version 2.40.0
```

---

## 🚀 Instalação Rápida (5 minutos)

### 1. Clonar o Repositório

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/treinamento-prompt-sebrae.git

# Entre no diretório
cd treinamento-prompt-sebrae
```

### 2. Instalar Dependências

```bash
# Usando pnpm (recomendado)
pnpm install

# Ou usando npm
npm install

# Ou usando yarn
yarn install
```

### 3. Iniciar Servidor de Desenvolvimento

```bash
# Usando pnpm
pnpm dev

# Ou usando npm
npm run dev
```

### 4. Abrir no Navegador

O site estará disponível em:
```
http://localhost:5173
```

---

## 🔧 Instalação Detalhada (Windows)

### Passo 1: Instalar Node.js

1. Visite [nodejs.org](https://nodejs.org)
2. Baixe a versão LTS (22.13.0+)
3. Execute o instalador `.msi`
4. Siga as instruções (deixe as opções padrão)
5. Reinicie o computador

### Passo 2: Verificar Instalação

Abra o **PowerShell** ou **CMD** e execute:

```powershell
node --version
npm --version
```

### Passo 3: Instalar pnpm (Opcional, mas Recomendado)

```powershell
npm install -g pnpm
pnpm --version
```

### Passo 4: Clonar Repositório

```powershell
# Navegue até a pasta onde deseja clonar
cd C:\Users\SeuUsuario\Projetos

# Clone o repositório
git clone https://github.com/seu-usuario/treinamento-prompt-sebrae.git

# Entre no diretório
cd treinamento-prompt-sebrae
```

### Passo 5: Instalar Dependências

```powershell
pnpm install
# Isso pode levar 2-3 minutos na primeira vez
```

### Passo 6: Iniciar Desenvolvimento

```powershell
pnpm dev
```

Abra o navegador e acesse: `http://localhost:5173`

---

## 🍎 Instalação Detalhada (macOS)

### Passo 1: Instalar Homebrew (se não tiver)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Passo 2: Instalar Node.js

```bash
# Usando Homebrew
brew install node

# Ou baixe de nodejs.org
```

### Passo 3: Verificar Instalação

```bash
node --version
npm --version
```

### Passo 4: Instalar pnpm

```bash
npm install -g pnpm
pnpm --version
```

### Passo 5: Clonar Repositório

```bash
# Navegue até a pasta de projetos
cd ~/Projects

# Clone o repositório
git clone https://github.com/seu-usuario/treinamento-prompt-sebrae.git

# Entre no diretório
cd treinamento-prompt-sebrae
```

### Passo 6: Instalar Dependências

```bash
pnpm install
```

### Passo 7: Iniciar Desenvolvimento

```bash
pnpm dev
```

Abra o navegador e acesse: `http://localhost:5173`

---

## 🐧 Instalação Detalhada (Linux - Ubuntu/Debian)

### Passo 1: Atualizar Sistema

```bash
sudo apt update
sudo apt upgrade -y
```

### Passo 2: Instalar Node.js

```bash
# Usando NodeSource repository (recomendado)
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

# Ou usando apt (versão pode ser mais antiga)
sudo apt install -y nodejs npm
```

### Passo 3: Verificar Instalação

```bash
node --version
npm --version
```

### Passo 4: Instalar pnpm

```bash
npm install -g pnpm
pnpm --version
```

### Passo 5: Clonar Repositório

```bash
# Navegue até a pasta de projetos
cd ~/projects

# Clone o repositório
git clone https://github.com/seu-usuario/treinamento-prompt-sebrae.git

# Entre no diretório
cd treinamento-prompt-sebrae
```

### Passo 6: Instalar Dependências

```bash
pnpm install
```

### Passo 7: Iniciar Desenvolvimento

```bash
pnpm dev
```

Abra o navegador e acesse: `http://localhost:5173`

---

## 🐳 Instalação com Docker

### Pré-requisitos

- Docker instalado ([docker.com](https://www.docker.com))
- Docker Compose (incluído no Docker Desktop)

### Passo 1: Criar Dockerfile

Se não existir, crie `Dockerfile` na raiz do projeto:

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

### Passo 2: Criar docker-compose.yml

```yaml
version: '3.8'

services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    volumes:
      - ./dist:/app/dist
```

### Passo 3: Build e Run

```bash
# Build da imagem
docker build -t treinamento-prompt .

# Run do container
docker run -p 3000:3000 treinamento-prompt

# Ou com docker-compose
docker-compose up
```

Acesse: `http://localhost:3000`

---

## 🔧 Configuração Pós-Instalação

### 1. Variáveis de Ambiente

Crie um arquivo `.env.local` na raiz do projeto (se necessário):

```env
# Exemplo (geralmente não é necessário para desenvolvimento)
VITE_APP_TITLE=Engenharia de Prompt
VITE_APP_LOGO=https://seu-dominio.com/logo.png
```

### 2. Verificar Tipos TypeScript

```bash
pnpm check
```

### 3. Formatar Código

```bash
pnpm format
```

### 4. Build para Produção

```bash
pnpm build

# Visualizar build localmente
pnpm preview
```

---

## 🧪 Verificar Instalação

Execute os seguintes comandos para verificar se tudo está funcionando:

```bash
# 1. Verificar dependências
pnpm list

# 2. Verificar tipos
pnpm check

# 3. Build de teste
pnpm build

# 4. Iniciar dev server
pnpm dev
```

Se tudo correr sem erros, a instalação foi bem-sucedida! ✅

---

## 🐛 Troubleshooting

### Erro: "pnpm: command not found"

```bash
# Instale pnpm globalmente
npm install -g pnpm

# Ou use npm diretamente
npm install
npm run dev
```

### Erro: "Port 5173 already in use"

```bash
# Use uma porta diferente
pnpm dev -- --port 3000

# Ou mate o processo usando a porta
# Windows
netstat -ano | findstr :5173
taskkill /PID <PID> /F

# macOS/Linux
lsof -i :5173
kill -9 <PID>
```

### Erro: "Module not found"

```bash
# Limpe node_modules e reinstale
rm -rf node_modules pnpm-lock.yaml
pnpm install
```

### Erro: "Permission denied"

```bash
# No Linux/macOS, pode ser necessário usar sudo
sudo pnpm install

# Ou ajustar permissões
chmod -R 755 node_modules
```

### Erro: "ENOSPC: no space left on device"

```bash
# Limpe cache do npm/pnpm
pnpm store prune
npm cache clean --force

# Ou libere espaço em disco
```

---

## 📊 Verificar Performance

### Build Time

```bash
# Medir tempo de build
time pnpm build
```

Esperado: < 30 segundos

### Dev Server Startup

```bash
# O servidor deve iniciar em < 5 segundos
pnpm dev
```

### Bundle Size

```bash
# Verificar tamanho do build
du -sh dist/
```

Esperado: < 500 KB (gzipped)

---

## 🔐 Segurança

### Verificar Vulnerabilidades

```bash
# npm
npm audit

# pnpm
pnpm audit

# Corrigir automaticamente
pnpm audit --fix
```

### Atualizar Dependências

```bash
# Verificar atualizações disponíveis
pnpm outdated

# Atualizar tudo
pnpm update

# Atualizar pacote específico
pnpm update react@latest
```

---

## 📚 Próximos Passos

Após a instalação bem-sucedida:

1. **Explorar o Código:** Abra `client/src/pages/Home.tsx`
2. **Ler Documentação:** Veja [README.md](README.md)
3. **Contribuir:** Veja [CONTRIBUTING.md](CONTRIBUTING.md)
4. **Deploy:** Veja [Deploy Guide](DEPLOY.md) (se existir)

---

## 💬 Precisa de Ajuda?

- **Issues:** [GitHub Issues](https://github.com/seu-usuario/treinamento-prompt-sebrae/issues)
- **Discussions:** [GitHub Discussions](https://github.com/seu-usuario/treinamento-prompt-sebrae/discussions)
- **Email:** [seu-email@sebrae.com.br]

---

**Última atualização:** 13 de maio de 2025
