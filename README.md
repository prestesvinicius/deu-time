# Deu Time - aplicativo de organização de eventos esportivos

## Descrição

Deu Time foi o projeto desenvolvido por nossa equipe durante 5 dias na semana final do HackaTruck, um curso de programação Swift, Internet das Coisas e de serviços cognitivos em nuvem oferecido pela IBM em parceria com o Instituto Eldorado.
O aplicativo veio como solução a um problema em comum entre os participantes do grupo: Encontrar um grupo de pessoas para praticar esportes de sua preferencia na área da cidade em que moravam.

## Funcionalidades
O MVP proposto continha as seguintes funcionalidades:
* Buscar eventos por Modalidade, Região da cidade e Espaço
* Criar eventos esportivos em Espaços disponibilizados
* Confirmar participação em eventos esportivos
* Visualizar o perfil de outros usuários

## Servidor Node-red
No desenvolvimento do aplicativo além do código em Swift desenvolvemos um flow em node-red, para conectar nossas informações a um servidor na nuvem fornecido pela IBM cloud.
O flow criado pode ser acessado pelo arquivo 'deu-time-flow.json'.

## Estrutura do app
Dentro do aplicativo foram desenvolvidas nove telas, algumas estáticas disponibilizando informações retiradas da API e outras dinâmicas que carregavam informações a partir do clique na tela anterior. Abaixo é possivel visualizar o funcionamento de cada tela em maiores detalhes.
### Tela de Login
<img src="https://github.com/prestesvinicius/deu-time/blob/main/telaLogin.jpeg" alt="Alt Text" width="300">

### Tela Principal
<img src="https://github.com/prestesvinicius/deu-time/blob/main/HomeView.gif" alt="Alt Text" width="300">

### Tela de Criação de Evento
<img src="https://github.com/prestesvinicius/deu-time/blob/main/novoEvento.gif" alt="Alt Text" width="300">

### Tela de Perfil do Usuário
<img src="https://github.com/prestesvinicius/deu-time/blob/main/TelaOwnUser.png" alt="Alt Text" width="300">

### Tela de Modalidade
<img src="https://github.com/prestesvinicius/deu-time/blob/main/TelaModalidade.png" alt="Alt Text" width="300">

### Tela de Espaço
<img src="https://github.com/prestesvinicius/deu-time/blob/main/telaEspaco.gif" alt="Alt Text" width="300">

### Tela de Região
<img src="https://github.com/prestesvinicius/deu-time/blob/main/TelaRegião.png" alt="Alt Text" width="300">

### Tela de Evento
<img src="https://github.com/prestesvinicius/deu-time/blob/main/telaEvento.gif" alt="Alt Text" width="300">

### Tela de Visualização de Perfil 
<img src="https://github.com/prestesvinicius/deu-time/blob/main/telaUser.png" alt="Alt Text" width="300">

