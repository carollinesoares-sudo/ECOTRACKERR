 DOCUMENTAÇÃO DE REQUISITOS
Aplicativo: EcoTracker
1. Introdução
1.1 Propósito

Este documento tem como objetivo descrever os requisitos do aplicativo EcoTracker, desenvolvido para auxiliar usuários a acompanharem e melhorarem seus hábitos sustentáveis no dia a dia.

1.2 Escopo

O EcoTracker é um aplicativo mobile desenvolvido em Flutter que permite:

Registrar hábitos sustentáveis
Acompanhar ações realizadas
Visualizar progresso ambiental
Gerenciar metas e configurações
1.3 Definições
Habitos Pendentes: Ações ainda não realizadas
Habitos Concluídos: Ações já realizadas pelo usuário
Dashboard: Tela com resumo dos dados
Provider: Gerenciamento de estado da aplicação
2. Descrição Geral
2.1 Visão do Produto

O aplicativo será utilizado por pessoas interessadas em melhorar seu impacto ambiental, promovendo práticas sustentáveis através de acompanhamento diário.

2.2 Funcionalidades Principais
Navegação entre telas
Controle de hábitos
Dashboard com estatísticas
Configurações do usuário
2.3 Usuários
Usuários comuns (pessoas interessadas em sustentabilidade)
3. Requisitos Funcionais
RF01 – Tela Inicial

O sistema deve apresentar uma tela inicial com:

Nome do aplicativo
Descrição
Botão de entrada
RF02 – Navegação

O sistema deve permitir navegação entre telas utilizando:

BottomNavigationBar
RF03 – Tela de Hábitos

O sistema deve permitir:

Visualizar hábitos pendentes
Marcar hábitos como concluídos
Mover hábitos para lista de concluídos
RF04 – Dashboard

O sistema deve exibir:

Total de hábitos concluídos
Total de hábitos pendentes
Pontuação ecológica
Progresso do usuário
RF05 – Configurações

O sistema deve permitir:

Ativar/desativar modo escuro
Resetar hábitos
RF06 – Gerenciamento de Estado

O sistema deve utilizar o Provider para:

Atualizar telas automaticamente
Gerenciar listas de hábitos
Controlar navegação
4. Requisitos Não Funcionais
RNF01 – Usabilidade

O sistema deve possuir interface simples, intuitiva e responsiva.

RNF02 – Performance

As ações devem ocorrer em tempo real sem travamentos.

RNF03 – Portabilidade

O sistema deve funcionar em dispositivos Android.

RNF04 – Organização

O código deve ser organizado em:

telas (screens)
providers
widgets
5. Interface do Sistema
5.1 Tela Inicial
Logo do aplicativo
Nome EcoTracker
Botão "Entrar"
5.2 Tela de Hábitos
Lista de hábitos pendentes
Lista de hábitos concluídos
Botão de conclusão (✔)
5.3 Dashboard
Cards com:
Concluídos
Pendentes
Pontuação
Progresso
5.4 Configurações
Switch de modo escuro
Botão de reset
6. Modelagem de Dados
6.1 Estrutura do Provider
Lista de hábitos
Lista de concluídos
Controle de tela
Configurações do usuário
7. Restrições
Uso obrigatório do Flutter
Uso obrigatório do Provider
Mínimo de 3 telas
Interface responsiva
8. Critérios de Aceitação

O sistema será considerado completo se:

✔ Navegação estiver funcionando
✔ Provider estiver implementado
✔ Hábitos forem movidos corretamente
✔ Dashboard atualizar automaticamente
✔ Interface estiver organizada

9. Considerações Finais

O EcoTracker é um aplicativo educacional com foco em sustentabilidade, promovendo consciência ambiental por meio da tecnologia.