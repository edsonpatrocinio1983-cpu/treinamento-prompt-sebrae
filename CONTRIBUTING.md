# 🤝 Guia de Contribuição

Obrigado por considerar contribuir para o **Treinamento de Engenharia de Prompt**! Este documento fornece diretrizes e instruções para contribuir de forma efetiva.

## 📋 Código de Conduta

Este projeto adota um Código de Conduta para garantir um ambiente acolhedor para todos. Esperamos que todos os contribuidores sigam as diretrizes de respeito, inclusão e profissionalismo.

**Comportamentos esperados:**
- Ser respeitoso e inclusivo
- Fornecer feedback construtivo
- Focar no que é melhor para a comunidade
- Mostrar empatia com outros contribuidores

**Comportamentos inaceitáveis:**
- Linguagem ou imagens sexualizadas
- Assédio ou insultos
- Ataques pessoais
- Publicação de informações privadas sem consentimento

---

## 🎯 Como Contribuir

### Reportar Bugs

Se você encontrou um bug, abra uma **Issue** no GitHub com as seguintes informações:

1. **Título descritivo:** "Bug: [descrição breve]"
2. **Descrição detalhada:** O que você esperava vs. o que aconteceu
3. **Passos para reproduzir:** Instruções claras passo a passo
4. **Ambiente:** Navegador, SO, versão do Node.js
5. **Screenshots/Logs:** Se aplicável

**Exemplo:**
```
Título: Bug: Checklist não salva pontuação ao recarregar página

Descrição:
Ao completar o checklist do Módulo 6 e recarregar a página, a pontuação volta para 0%.

Passos para reproduzir:
1. Ir para Módulo 6
2. Marcar 5 itens do checklist
3. Recarregar a página (F5)
4. Observar que a pontuação foi resetada

Ambiente:
- Navegador: Chrome 125.0
- SO: Windows 11
- Node.js: 22.13.0
```

### Sugerir Melhorias

Para sugerir uma melhoria, abra uma **Issue** com:

1. **Título:** "Feature: [descrição da melhoria]"
2. **Motivação:** Por que essa melhoria seria útil?
3. **Descrição detalhada:** Como deveria funcionar?
4. **Exemplos:** Casos de uso ou mockups

**Exemplo:**
```
Título: Feature: Adicionar modo "Apresentação" para instrutor

Motivação:
Instrutores precisam de uma forma de apresentar o conteúdo em sala de aula sem distrações.

Descrição:
Um modo fullscreen que:
- Oculta navegação e footer
- Permite navegação com setas do teclado
- Mostra apenas o conteúdo do módulo atual
- Suporta anotações em tempo real

Casos de uso:
- Apresentação em projetor
- Webinar ao vivo
- Gravação de vídeo
```

### Submeter Pull Requests

Siga este processo para submeter um PR:

#### 1. Fork e Clone

```bash
# Fork o repositório (via GitHub UI)
# Clone seu fork
git clone https://github.com/seu-usuario/treinamento-prompt-sebrae.git
cd treinamento-prompt-sebrae

# Adicione o repositório original como upstream
git remote add upstream https://github.com/sebrae/treinamento-prompt-sebrae.git
```

#### 2. Crie uma Branch

```bash
# Atualize main
git fetch upstream
git checkout main
git merge upstream/main

# Crie uma branch descritiva
git checkout -b feature/adicionar-quiz-modulo-1
# ou
git checkout -b fix/corrigir-tooltip-overflow
```

**Convenção de nomes:**
- `feature/` — Novas funcionalidades
- `fix/` — Correções de bugs
- `docs/` — Atualizações de documentação
- `refactor/` — Refatoração de código
- `test/` — Adição de testes

#### 3. Faça suas Mudanças

```bash
# Edite os arquivos necessários
# Teste localmente
pnpm dev

# Verifique tipos
pnpm check

# Formate o código
pnpm format
```

#### 4. Commit com Mensagens Claras

```bash
# Use mensagens descritivas
git commit -m "feat: adicionar quiz interativo ao Módulo 1

- Implementar componente Quiz com 5 questões
- Adicionar lógica de pontuação
- Integrar com checklist existente
- Adicionar estilos responsivos"
```

**Convenção de commits:**
- `feat:` — Nova funcionalidade
- `fix:` — Correção de bug
- `docs:` — Documentação
- `style:` — Formatação (sem mudança lógica)
- `refactor:` — Refatoração
- `test:` — Testes
- `chore:` — Tarefas de manutenção

#### 5. Push e Abra um PR

```bash
# Push para seu fork
git push origin feature/adicionar-quiz-modulo-1

# Abra um PR via GitHub UI
```

**Descrição do PR:**

```markdown
## Descrição
Adiciona um quiz interativo ao final do Módulo 1 para aumentar retenção.

## Tipo de Mudança
- [x] Nova funcionalidade
- [ ] Correção de bug
- [ ] Mudança que quebra compatibilidade

## Mudanças
- Novo componente `Quiz.tsx` com 5 questões
- Integração com `Module1.tsx`
- Estilos responsivos com Tailwind

## Como Testar
1. Ir para Módulo 1
2. Rolar até o final
3. Responder as 5 questões
4. Verificar pontuação

## Checklist
- [x] Código segue o style guide
- [x] Testei localmente
- [x] Atualizei a documentação
- [x] Sem warnings no console

## Screenshots (se aplicável)
[Adicione screenshots aqui]
```

---

## 🛠️ Guia de Desenvolvimento

### Estrutura de Pastas

Ao adicionar novos componentes, siga a estrutura:

```
client/src/components/
├── ModuleX.tsx              # Componente principal
├── ModuleX.module.css       # Estilos (se necessário)
└── subcomponents/
    ├── Quiz.tsx             # Subcomponentes
    └── Feedback.tsx
```

### Padrões de Código

#### Componentes React

```typescript
// ✅ Bom
export default function Quiz() {
  const [score, setScore] = useState(0);
  
  useEffect(() => {
    // Lógica
  }, []);
  
  return (
    <div className="p-6 rounded-xl">
      {/* JSX */}
    </div>
  );
}

// ❌ Evitar
function quiz() {  // Minúscula
  var score = 0;   // var em vez de const/let
  // ...
}
```

#### Estilos com Tailwind

```typescript
// ✅ Bom
<div className="p-4 rounded-lg bg-blue-50 text-blue-900">
  {/* Usar classes Tailwind */}
</div>

// ❌ Evitar
<div style={{ padding: '16px', borderRadius: '8px' }}>
  {/* Estilos inline */}
</div>
```

#### Tipos TypeScript

```typescript
// ✅ Bom
interface QuizQuestion {
  id: number;
  text: string;
  options: string[];
  correctAnswer: number;
}

// ❌ Evitar
const question = {
  id: 1,
  text: "...",
  // Sem tipos
};
```

### Checklist Antes de Submeter

- [ ] Código segue o padrão do projeto
- [ ] Sem console.log() ou console.error() deixados
- [ ] Testei em desktop e mobile
- [ ] Atualizei a documentação se necessário
- [ ] Sem breaking changes (ou documentei)
- [ ] Commits têm mensagens claras
- [ ] Branch está atualizada com `upstream/main`

---

## 📚 Áreas de Contribuição

### 🎓 Conteúdo Educacional

- Adicionar novos módulos sobre tópicos relacionados
- Melhorar exemplos com casos reais brasileiros
- Adicionar referências acadêmicas
- Traduzir conteúdo para outros idiomas

### 🎨 Design & UX

- Melhorar responsividade
- Adicionar animações
- Otimizar acessibilidade
- Criar novos temas de cores

### 💻 Desenvolvimento

- Adicionar quiz interativo
- Implementar certificado de conclusão
- Criar modo "Apresentação"
- Integrar com LMS
- Adicionar testes automatizados

### 📖 Documentação

- Melhorar README
- Adicionar guias de instalação
- Criar tutoriais em vídeo
- Documentar APIs internas

---

## 🧪 Testes

### Executar Testes

```bash
# Se configurado
pnpm test

# Verificar tipos
pnpm check

# Verificar formatação
pnpm format --check
```

### Adicionar Testes

Para novos componentes, adicione testes em `__tests__/`:

```typescript
// __tests__/Quiz.test.tsx
import { render, screen } from '@testing-library/react';
import Quiz from '../Quiz';

describe('Quiz Component', () => {
  it('renders quiz questions', () => {
    render(<Quiz />);
    expect(screen.getByText(/questão 1/i)).toBeInTheDocument();
  });
});
```

---

## 🚀 Processo de Review

1. **Verificação Automática:** GitHub Actions verifica tipos, formatação
2. **Review Manual:** Maintainers revisam código e lógica
3. **Testes:** Verificação em múltiplos navegadores
4. **Aprovação:** Pelo menos 1 maintainer aprova
5. **Merge:** PR é mergeado para `main`

---

## 📋 Checklist para Maintainers

- [ ] PR tem descrição clara
- [ ] Código segue padrões do projeto
- [ ] Testes passam
- [ ] Sem conflitos com `main`
- [ ] Documentação atualizada
- [ ] Changelog atualizado

---

## 🎓 Recursos para Contribuidores

- [React Documentation](https://react.dev)
- [Tailwind CSS Docs](https://tailwindcss.com/docs)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Git Documentation](https://git-scm.com/doc)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

## ❓ Perguntas?

- Abra uma **Discussion** no GitHub
- Envie um email para [seu-email@sebrae.com.br]
- Participe do nosso Slack/Discord (se aplicável)

---

## 🙏 Obrigado!

Sua contribuição é valiosa para a comunidade de Engenharia de Prompt no Brasil. Juntos, estamos tornando a educação em IA mais acessível e de qualidade.

**Bem-vindo ao projeto!** 🚀

---

**Última atualização:** 13 de maio de 2025
