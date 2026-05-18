#!/bin/bash

# Deploy Script para Treinamento Engenharia de Prompt
# Este script automatiza o processo de build e deploy

set -e  # Exit on error

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funções
print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

# Verificar pré-requisitos
check_prerequisites() {
    print_header "Verificando Pré-requisitos"
    
    if ! command -v node &> /dev/null; then
        print_error "Node.js não está instalado"
        exit 1
    fi
    print_success "Node.js: $(node --version)"
    
    if ! command -v pnpm &> /dev/null; then
        print_warning "pnpm não está instalado. Usando npm."
        PACKAGE_MANAGER="npm"
    else
        PACKAGE_MANAGER="pnpm"
        print_success "pnpm: $(pnpm --version)"
    fi
    
    if ! command -v git &> /dev/null; then
        print_error "Git não está instalado"
        exit 1
    fi
    print_success "Git: $(git --version)"
}

# Instalar dependências
install_dependencies() {
    print_header "Instalando Dependências"
    
    if [ "$PACKAGE_MANAGER" = "pnpm" ]; then
        pnpm install
    else
        npm install
    fi
    
    print_success "Dependências instaladas"
}

# Verificar tipos TypeScript
check_types() {
    print_header "Verificando Tipos TypeScript"
    
    if [ "$PACKAGE_MANAGER" = "pnpm" ]; then
        pnpm check
    else
        npm run check
    fi
    
    print_success "Tipos verificados"
}

# Build
build() {
    print_header "Fazendo Build"
    
    if [ "$PACKAGE_MANAGER" = "pnpm" ]; then
        pnpm build
    else
        npm run build
    fi
    
    print_success "Build concluído"
    
    # Mostrar tamanho do build
    if command -v du &> /dev/null; then
        BUILD_SIZE=$(du -sh dist/ 2>/dev/null | cut -f1)
        print_info "Tamanho do build: $BUILD_SIZE"
    fi
}

# Deploy para Vercel
deploy_vercel() {
    print_header "Fazendo Deploy para Vercel"
    
    if ! command -v vercel &> /dev/null; then
        print_error "Vercel CLI não está instalado"
        print_info "Instale com: npm install -g vercel"
        exit 1
    fi
    
    vercel --prod
    print_success "Deploy para Vercel concluído"
}

# Deploy para Netlify
deploy_netlify() {
    print_header "Fazendo Deploy para Netlify"
    
    if ! command -v netlify &> /dev/null; then
        print_error "Netlify CLI não está instalado"
        print_info "Instale com: npm install -g netlify-cli"
        exit 1
    fi
    
    netlify deploy --prod --dir=dist
    print_success "Deploy para Netlify concluído"
}

# Deploy para GitHub Pages
deploy_github_pages() {
    print_header "Fazendo Deploy para GitHub Pages"
    
    # Verificar se está em um repositório Git
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_error "Não está em um repositório Git"
        exit 1
    fi
    
    # Fazer build
    build
    
    # Criar branch gh-pages se não existir
    if ! git show-ref --quiet refs/heads/gh-pages; then
        print_info "Criando branch gh-pages..."
        git checkout --orphan gh-pages
        git rm -rf .
        git commit --allow-empty -m "Initial commit for GitHub Pages"
        git checkout main
    fi
    
    # Fazer push do dist para gh-pages
    print_info "Fazendo push para gh-pages..."
    git subtree push --prefix dist origin gh-pages
    
    print_success "Deploy para GitHub Pages concluído"
}

# Deploy para AWS S3
deploy_s3() {
    print_header "Fazendo Deploy para AWS S3"
    
    if ! command -v aws &> /dev/null; then
        print_error "AWS CLI não está instalado"
        print_info "Instale em: https://aws.amazon.com/cli/"
        exit 1
    fi
    
    # Verificar se bucket foi especificado
    if [ -z "$S3_BUCKET" ]; then
        print_error "Variável S3_BUCKET não foi definida"
        print_info "Use: S3_BUCKET=seu-bucket ./scripts/deploy.sh s3"
        exit 1
    fi
    
    # Build
    build
    
    # Fazer sync com S3
    print_info "Fazendo sync com S3..."
    aws s3 sync dist/ "s3://$S3_BUCKET" --delete
    
    print_success "Deploy para S3 concluído"
}

# Deploy para Docker
deploy_docker() {
    print_header "Fazendo Deploy com Docker"
    
    if ! command -v docker &> /dev/null; then
        print_error "Docker não está instalado"
        exit 1
    fi
    
    # Build da imagem
    print_info "Fazendo build da imagem Docker..."
    docker build -t treinamento-prompt:latest .
    
    print_success "Imagem Docker criada: treinamento-prompt:latest"
    print_info "Para rodar: docker run -p 3000:3000 treinamento-prompt:latest"
}

# Fazer commit e push
commit_and_push() {
    print_header "Fazendo Commit e Push"
    
    if [ -z "$1" ]; then
        print_error "Mensagem de commit não foi fornecida"
        exit 1
    fi
    
    git add .
    git commit -m "$1"
    git push origin main
    
    print_success "Commit e push concluídos"
}

# Mostrar ajuda
show_help() {
    cat << EOF
${BLUE}Treinamento Engenharia de Prompt - Deploy Script${NC}

Uso: ./scripts/deploy.sh [comando] [opções]

Comandos:
    check           Verificar pré-requisitos
    install         Instalar dependências
    build           Fazer build do projeto
    dev             Iniciar servidor de desenvolvimento
    vercel          Deploy para Vercel
    netlify         Deploy para Netlify
    github-pages    Deploy para GitHub Pages
    s3              Deploy para AWS S3
    docker          Build imagem Docker
    commit          Fazer commit e push
    full            Executar: check → install → build → vercel
    help            Mostrar esta mensagem

Exemplos:
    ./scripts/deploy.sh check
    ./scripts/deploy.sh build
    ./scripts/deploy.sh vercel
    ./scripts/deploy.sh commit "feat: adicionar novo módulo"
    S3_BUCKET=meu-bucket ./scripts/deploy.sh s3

Variáveis de Ambiente:
    S3_BUCKET       Nome do bucket S3 (para deploy S3)

${YELLOW}Nota: Execute este script a partir da raiz do projeto${NC}

EOF
}

# Main
main() {
    COMMAND=${1:-help}
    
    case $COMMAND in
        check)
            check_prerequisites
            ;;
        install)
            check_prerequisites
            install_dependencies
            ;;
        build)
            check_prerequisites
            install_dependencies
            check_types
            build
            ;;
        dev)
            check_prerequisites
            install_dependencies
            print_header "Iniciando Servidor de Desenvolvimento"
            if [ "$PACKAGE_MANAGER" = "pnpm" ]; then
                pnpm dev
            else
                npm run dev
            fi
            ;;
        vercel)
            check_prerequisites
            install_dependencies
            check_types
            build
            deploy_vercel
            ;;
        netlify)
            check_prerequisites
            install_dependencies
            check_types
            build
            deploy_netlify
            ;;
        github-pages)
            check_prerequisites
            install_dependencies
            check_types
            deploy_github_pages
            ;;
        s3)
            check_prerequisites
            install_dependencies
            check_types
            deploy_s3
            ;;
        docker)
            check_prerequisites
            deploy_docker
            ;;
        commit)
            if [ -z "$2" ]; then
                print_error "Mensagem de commit não foi fornecida"
                print_info "Uso: ./scripts/deploy.sh commit \"sua mensagem\""
                exit 1
            fi
            commit_and_push "$2"
            ;;
        full)
            check_prerequisites
            install_dependencies
            check_types
            build
            deploy_vercel
            ;;
        help)
            show_help
            ;;
        *)
            print_error "Comando desconhecido: $COMMAND"
            show_help
            exit 1
            ;;
    esac
    
    print_success "Operação concluída com sucesso!"
}

# Executar main
main "$@"
