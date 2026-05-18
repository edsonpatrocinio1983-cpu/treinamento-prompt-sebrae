# 🎓 Engenharia de Prompt: Do Caos ao Resultado

**Treinamento Corporativo Interativo — Sebrae 2025/2026**

Um site de treinamento moderno, responsivo e totalmente interativo sobre Engenharia de Prompt, desenvolvido com React 19, Tailwind CSS 4 e componentes shadcn/ui. Inclui 6 módulos estruturados, gráficos interativos, checklist prático, mapa de IAs 2025/2026 e material de apoio em PDF.

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![React](https://img.shields.io/badge/React-19.2.1-blue.svg)](https://react.dev)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind%20CSS-4.1.14-38B2AC.svg)](https://tailwindcss.com)
[![Node.js](https://img.shields.io/badge/Node.js-22.13.0-green.svg)](https://nodejs.org)

---

## 📋 Visão Geral

Este projeto é um **treinamento corporativo completo** sobre Engenharia de Prompt, desenvolvido para profissionais brasileiros que desejam dominar a comunicação com Inteligência Artificial. O site oferece:

- **6 Módulos Estruturados:** Fundamentos, Frameworks, Certo vs. Errado, Técnicas Avançadas, Mapa de IAs e Checklist Prático
- **Base Acadêmica Sólida:** Referências de arXiv 2024, ESPM, IBM Research, Wei et al., PMI
- **Conteúdo Interativo:** Gráficos Recharts, tooltips para termos técnicos, checklist com pontuação em tempo real
- **Material de Apoio:** Mini livro em PDF com 8 seções, glossário completo e referências bibliográficas
- **Design Premium:** Paleta Sebrae (azul #2A4FDA + laranja #FF8C00), tipografia Space Grotesk + JetBrains Mono
- **Responsivo:** Totalmente otimizado para desktop, tablet e mobile

---

## 🎯 Características Principais

### Conteúdo Educacional

| Módulo | Foco | Duração | Técnicas |
|--------|------|---------|----------|
| 1 — Fundamentos | Como IAs funcionam realmente | 5 min | Tokenização, Embeddings, Atenção |
| 2 — Frameworks | 5 metodologias comprovadas | 8 min | RTF, CREATE, AIM, C.E.R.T.O, CoT |
| 3 — Certo vs. Errado | 8 casos reais analisados | 7 min | Análise comparativa, padrões de erro |
| 4 — 9 Técnicas | Técnicas avançadas de prompting | 10 min | Zero-Shot, Few-Shot, Context Engineering |
| 5 — Mapa de IAs | 10+ categorias de IAs 2025/26 | 6 min | Textos, Imagens, Pesquisa, Código, Áudio |
| 6 — Checklist | Simulação final + template universal | 4 min | 12 critérios, pontuação em tempo real |

### Recursos Técnicos

- **React 19** com hooks modernos (useState, useEffect, useContext)
- **Tailwind CSS 4** com variáveis CSS personalizadas e tema escuro/claro
- **shadcn/ui** para componentes acessíveis (Button, Card, Dialog, Tabs, etc.)
- **Recharts** para gráficos interativos (barras, radar, linhas)
- **Wouter** para roteamento client-side leve
- **Framer Motion** para animações suaves
- **TypeScript** para type safety
- **Vite** para build rápido e HMR

---

## 🚀 Quick Start

### Pré-requisitos

- Node.js 22.13.0 ou superior
- pnpm 10.4.1+ (recomendado) ou npm/yarn
- Git

### Instalação Local

```bash
# 1. Clonar o repositório
git clone https://github.com/seu-usuario/treinamento-prompt-sebrae.git
cd treinamento-prompt-sebrae

# 2. Instalar dependências
pnpm install
# ou: npm install

# 3. Iniciar servidor de desenvolvimento
pnpm dev
# ou: npm run dev

# 4. Abrir no navegador
# O site estará disponível em http://localhost:5173
```

### Build para Produção

```bash
# Compilar para produção
pnpm build
# ou: npm run build

# Visualizar build localmente
pnpm preview
# ou: npm run preview

# Verificar tipos TypeScript
pnpm check
# ou: npm run check
```

---

## 📁 Estrutura do Projeto

```
treinamento-prompt-sebrae/
├── client/                          # Frontend React
│   ├── public/                      # Arquivos estáticos (favicon, robots.txt)
│   ├── src/
│   │   ├── components/              # Componentes React reutilizáveis
│   │   │   ├── Navbar.tsx           # Navegação sticky com scroll ativo
│   │   │   ├── HeroSection.tsx      # Seção hero com imagem gerada
│   │   │   ├── InstructorSection.tsx # Perfil do instrutor (Edson)
│   │   │   ├── ModulesOverview.tsx  # Visão geral dos 6 módulos
│   │   │   ├── Module1.tsx          # Módulo 1 — Fundamentos
│   │   │   ├── Module2.tsx          # Módulo 2 — Os 5 Frameworks
│   │   │   ├── Module3.tsx          # Módulo 3 — Certo vs. Errado
│   │   │   ├── Module4.tsx          # Módulo 4 — As 9 Técnicas
│   │   │   ├── Module5.tsx          # Módulo 5 — Mapa de IAs
│   │   │   ├── Module6.tsx          # Módulo 6 — Checklist Final
│   │   │   ├── Footer.tsx           # Rodapé com links e download PDF
│   │   │   ├── Tooltip.tsx          # Componente de tooltip para termos
│   │   │   └── ui/                  # Componentes shadcn/ui
│   │   ├── pages/
│   │   │   ├── Home.tsx             # Página principal
│   │   │   └── NotFound.tsx         # Página 404
│   │   ├── contexts/
│   │   │   └── ThemeContext.tsx     # Contexto de tema (claro/escuro)
│   │   ├── hooks/
│   │   │   ├── useMobile.tsx        # Hook para detectar mobile
│   │   │   ├── useComposition.ts    # Hook customizado
│   │   │   └── usePersistFn.ts      # Hook para funções persistentes
│   │   ├── lib/
│   │   │   └── utils.ts             # Utilitários (cn, etc.)
│   │   ├── App.tsx                  # Componente raiz com rotas
│   │   ├── main.tsx                 # Entry point React
│   │   └── index.css                # Estilos globais + variáveis CSS
│   └── index.html                   # Template HTML
├── server/                          # Backend (placeholder para compatibilidade)
│   └── index.ts                     # Express server (não usado em static)
├── shared/                          # Código compartilhado
│   └── const.ts                     # Constantes globais
├── public/                          # Assets públicos (se houver)
├── package.json                     # Dependências e scripts
├── tsconfig.json                    # Configuração TypeScript
├── tailwind.config.js               # Configuração Tailwind CSS 4
├── vite.config.ts                   # Configuração Vite
├── .gitignore                       # Arquivos ignorados pelo Git
├── .prettierrc                      # Configuração Prettier
├── LICENSE                          # Licença CC BY 4.0
├── CONTRIBUTING.md                  # Guia de contribuição
└── README.md                        # Este arquivo
```

---

## 🎨 Design & Paleta de Cores

O projeto utiliza a **paleta oficial do Sebrae** com extensões para melhor contraste e acessibilidade:

| Cor | Hex | Uso |
|-----|-----|-----|
| Sebrae Blue | `#2A4FDA` | Primária, títulos, botões |
| Sebrae Orange | `#FF8C00` | Destaque, CTAs, badges |
| Light Gray | `#F5F5F5` | Backgrounds, cards |
| Dark Gray | `#333333` | Texto principal |
| White | `#FFFFFF` | Backgrounds claros |

**Tipografia:**
- **Display/Títulos:** Space Grotesk (bold, 700)
- **Corpo/Texto:** Helvetica/System fonts (regular, 400)
- **Código/Monospace:** JetBrains Mono (regular, 400)

---

## 📦 Dependências Principais

```json
{
  "dependencies": {
    "react": "^19.2.1",
    "react-dom": "^19.2.1",
    "recharts": "^2.15.2",
    "tailwindcss": "^4.1.14",
    "framer-motion": "^12.23.22",
    "wouter": "^3.3.5",
    "lucide-react": "^0.453.0",
    "sonner": "^2.0.7"
  },
  "devDependencies": {
    "typescript": "5.6.3",
    "vite": "^7.1.7",
    "@vitejs/plugin-react": "^5.0.4",
    "prettier": "^3.6.2"
  }
}
```

---

## 🔧 Configuração & Customização

### Adicionar Novo Módulo

1. Criar componente em `client/src/components/ModuleX.tsx`
2. Importar em `client/src/pages/Home.tsx`
3. Adicionar entrada em `ModulesOverview.tsx`
4. Adicionar link no `Navbar.tsx` e `Footer.tsx`

### Customizar Cores

Editar `client/src/index.css` na seção `:root`:

```css
:root {
  --primary: var(--color-blue-700);  /* Sebrae Blue */
  --accent: oklch(0.65 0.19 45);     /* Sebrae Orange */
  /* ... mais variáveis */
}
```

### Adicionar Componentes shadcn/ui

```bash
# Exemplo: adicionar componente Dialog
pnpm dlx shadcn-ui@latest add dialog
```

---

## 📊 Conteúdo & Referências Acadêmicas

### Base Metodológica

O treinamento é fundamentado em pesquisa acadêmica de ponta:

- **Schulhoff, S. et al. (2024).** "A Systematic Survey of Prompt Engineering Techniques". arXiv:2406.06608. Cited by 580+
- **Wei, J. et al. (2022).** "Chain-of-Thought Prompting Elicits Reasoning in Large Language Models". NeurIPS 2022.
- **IBM Research (2023).** "Use role prompting with Watsonx and Granite".
- **ESPM (2024).** "Formação em Gestão de IA". Escola Superior de Propaganda e Marketing.
- **PMI (2024).** "AI in Project Management". Project Management Institute.

### Material de Apoio

Um **mini livro em PDF** com 8 seções está incluído:

1. Introdução: Por que Engenharia de Prompt?
2. Fundamentos: Como as IAs Realmente Funcionam
3. Os 5 Frameworks Metodológicos
4. Certo vs. Errado: 8 Casos Reais Analisados
5. As 9 Técnicas Avançadas
6. Mapa das IAs 2025/2026
7. Checklist Prático & Simulação Final
8. Glossário Completo + Referências Bibliográficas

---

## 🌐 Deploy

### Opção 1: Vercel (Recomendado)

```bash
# 1. Instalar Vercel CLI
npm i -g vercel

# 2. Deploy
vercel

# 3. Seguir prompts interativos
```

### Opção 2: Netlify

```bash
# 1. Instalar Netlify CLI
npm i -g netlify-cli

# 2. Build local
pnpm build

# 3. Deploy
netlify deploy --prod --dir=dist
```

### Opção 3: GitHub Pages

```bash
# 1. Editar vite.config.ts
# base: '/treinamento-prompt-sebrae/'

# 2. Build
pnpm build

# 3. Fazer push para branch 'gh-pages'
git subtree push --prefix dist origin gh-pages
```

### Opção 4: Docker

```dockerfile
# Dockerfile
FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "preview"]
```

```bash
# Build e run
docker build -t treinamento-prompt .
docker run -p 3000:3000 treinamento-prompt
```

---

## 🧪 Testes & Qualidade

```bash
# Verificar tipos TypeScript
pnpm check

# Formatar código
pnpm format

# Linter (se configurado)
pnpm lint
```

---

## 📱 Responsividade

O site é totalmente responsivo com breakpoints Tailwind:

- **Mobile:** < 640px (sm)
- **Tablet:** 640px - 1024px (md)
- **Desktop:** > 1024px (lg)

Todos os componentes foram testados em:
- iPhone 12/13/14/15
- iPad Air/Pro
- Desktop 1920x1080+

---

## ♿ Acessibilidade

O projeto segue as diretrizes WCAG 2.1 AA:

- Contraste de cores adequado (4.5:1 para texto)
- Navegação por teclado completa
- Labels semânticas em formulários
- Atributos ARIA onde necessário
- Suporte a leitores de tela

---

## 🔐 Segurança

- Sem dependências de código malicioso (auditadas com `npm audit`)
- Sem dados sensíveis no repositório (.gitignore configurado)
- HTTPS recomendado para produção
- Content Security Policy (CSP) configurável

---

## 📄 Licença

Este projeto está licenciado sob a **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

Você é livre para:
- ✅ Compartilhar — copiar e redistribuir o material
- ✅ Adaptar — remixar, transformar e construir sobre o material

Sob as condições de:
- 🏷️ Atribuição — dar crédito apropriado, fornecer link para a licença

Veja [LICENSE](LICENSE) para detalhes completos.

---

## 👥 Autor

**Edson Gonçalves Patrocínio**

Especialista em Design Instrucional e Engenharia de Prompt com 15+ anos de experiência em educação corporativa. Formado em Pedagogia, Administração, Geografia e Designer Instrucional (FAP 2022).

- LinkedIn: [linkedin.com/in/edson-gonçalves-patrocínio](https://www.linkedin.com/in/edson-gonçalves-patrocínio-a2595629)
- Email: [seu-email@sebrae.com.br]

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Veja [CONTRIBUTING.md](CONTRIBUTING.md) para diretrizes.

### Passos para Contribuir

1. Fork o repositório
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

---

## 📞 Suporte & Feedback

- **Issues:** [GitHub Issues](https://github.com/seu-usuario/treinamento-prompt-sebrae/issues)
- **Discussões:** [GitHub Discussions](https://github.com/seu-usuario/treinamento-prompt-sebrae/discussions)
- **Email:** [seu-email@sebrae.com.br]

---

## 🗺️ Roadmap

- [ ] Adicionar quiz interativo ao final de cada módulo
- [ ] Gerar certificado de conclusão em PDF
- [ ] Implementar modo "Apresentação" para instrutor
- [ ] Adicionar suporte a múltiplos idiomas (EN, ES)
- [ ] Integrar com LMS (Moodle, Canvas)
- [ ] Adicionar analytics avançado
- [ ] Criar versão mobile app (React Native)

---

## 📊 Estatísticas do Projeto

- **Linhas de Código:** ~5.000+ (React + CSS)
- **Componentes:** 15+ componentes React
- **Módulos:** 6 módulos educacionais
- **Referências Acadêmicas:** 10+ fontes
- **Tempo de Desenvolvimento:** 40+ horas
- **Cobertura Responsiva:** 100%
- **Acessibilidade:** WCAG 2.1 AA

---

## 🙏 Agradecimentos

- **Sebrae** — Pelo apoio e oportunidade
- **ESPM** — Pela metodologia AIM
- **IBM Research** — Pelos estudos em Role Prompting
- **Wei et al.** — Pelo seminal work em Chain-of-Thought
- **Comunidade Open Source** — React, Tailwind, shadcn/ui

---

## 📝 Changelog

### v1.0.0 (2025-05-13)
- ✅ Lançamento inicial
- ✅ 6 módulos completos
- ✅ Mini livro em PDF
- ✅ Tooltips para termos técnicos
- ✅ Checklist interativo com pontuação
- ✅ Mapa de IAs 2025/2026
- ✅ Design Sebrae completo

---

**Desenvolvido com ❤️ para profissionais brasileiros que querem dominar IA**

---

## 📚 Recursos Adicionais

- [Prompt Engineering Guide](https://www.promptingguide.ai/pt)
- [arXiv Prompt Engineering Papers](https://arxiv.org)
- [OpenAI Prompt Engineering](https://platform.openai.com/docs/guides/prompt-engineering)
- [IBM Prompt Engineering](https://www.ibm.com/think/topics/prompt-engineering-techniques)

---

**Última atualização:** 13 de maio de 2025
