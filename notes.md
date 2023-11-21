#### 20/11/2023

@01-Explorando o projeto e o BLoC

@@01
Apresentação

Olá! Meu nome é Matheus Alberto e serei seu instrutor neste curso de Flutter: B.L.O.C!
Matheus é um homem branco, possui cabelo castanho escuro curto e liso, e sombrancelhas grossas. Está sentado em uma cadeira preta acolchoada e usa fones de ouvido com fio. Ao fundo, uma parede azul.
Neste curso, seremos apresentados ao B.L.O.C com Cubit. Nosso projeto consiste na bilheteria Panucci, um aplicativo de compra de ingressos online.

A primeira funcionalidade que vamos implementar é a de carregar as informações de uma API e mostrá-las em nossa home page. Em seguida, teremos a opção de filtrar a lista de filmes baseado no gênero do filme que queremos assistir, como suspense, ação, comédia, entre outros. Usaremos o B.L.O.C para fazer isso.

Ao clicar em um filme, todo o tema da aplicação deve ser alterado. Ao se tratar de um filme de suspense, por exemplo, o tema passará a ser escuro.

No decorrer deste curso, passaremos pelos seguintes aprendizados:

entender o que é BloC e Cubit e quais as principais diferenças entre eles;
implementar padrão com BloC;
entender as camadas do projeto e como o BloC vai implementar uma nova camada para a aplicação;
fazer injeção de dependências com BloC Provider.
Para um bom aproveitamento do curso, é importante que você tenha conhecimentos básicos de Flutter e já tenha trabalhado com algum tipo de gerenciador de estados, como o Provider.

Vamos nessa?

@@02
Preparando o ambiente: conhecendo o projeto

Olá, Dev!
Matheus por aqui!

Você está iniciando seu mergulho no curso sobre Flutter: aplicando gerenciamento de estados com BLoC e Cubit!

Vamos preparar o ambiente baixando o projeto?

1) Baixando o projeto
Para acompanhar o desenvolvimento deste curso, é importante que você tenha todos os arquivos necessários. Você pode baixar o projeto inicial através deste link.

2) Do que preciso para rodar o projeto?
Ter uma IDE, que pode ser o Android Studio, instalada na sua máquina;
Ter a SDK do Flutter na versão 3.7.9;
Ter as seguintes bibliotecas instaladas:
http: ^0.13.5;
bloc: ^8.1.1;
flutter_bloc: ^8.1.2.
3) O que vou aprender neste curso?
Vamos aprofundar nossas habilidades em um popular gerenciador de estados: o BLoC! Isso é muito importante pois, conforme nossa aplicação cresce, precisamos lidar com os dados e passar informações entre telas de forma otimizada e facilitando o processo de desenvolvimento!

Além disso, o BLoC (com Cubit) é um gerenciado muito requisitado pelas empresas.

4) Como fazer este curso?
Durante sua jornada, você encontrará atividades práticas e teóricas para testar seus conhecimentos, material extra para se aprofundar nos seus estudos, e desafios para praticar suas habilidades.

Vamos conhecer algumas dicas para fazer bem este curso?

Levante a mão e participe! Tudo bem se não conseguir realizar alguma atividade, isso faz parte do processo. Procure o fórum ou nossa comunidade no Discord e aproveite para tirar dúvidas, para interagir com outras pessoas e ajudar um colega (ensinar é uma ótima forma de aprender);
Pratique! Faça, teste, replique as atividades do curso, pois assim ganhará confiança e fixará melhor o conteúdo;
Foque, mas descanse! Caso sinta-se cansado(a) ou não esteja entendendo algo, dê uma pausa, tome uma água, e depois assista novamente as videoaulas.
O importante é persistir até o fim! Preparado(a)? Podemos começar.

Bons estudos!

Um abraço,

Matheus Alberto.

https://github.com/alura-cursos/3033-bloc-com-cubit/archive/refs/heads/main.zip

https://developer.android.com/

https://docs.flutter.dev/get-started/install

@@03
Apresentando o projeto

Vamos conhecer um pouco do projeto que desenvolveremos: a bilheteria Panucci, que se trata de um aplicativo de compra de ingressos de filmes online.
Esse projeto já começou a ser implementado por outra equipe de desenvolvimento, então nossa função será desenvolver outras futures. Vamos conhecer o que foi feito até o momento!

Estrutura de arquivos
A primeira pasta que temos é "components", na qual estão todos os componentes utilizados na aplicação, como cartões, ícones, textos, botões, entre outros.

Alguns desses componentes estão separados por pastas. Em "checkout" temos uma lista de componentes que serão utilizados na página de mesmo nome; em "home", os componentes da página home, e assim por diante. Os componentes genéricos que serão utilizados em várias outras páginas estão na raiz "components".

A pasta "models" possui a representação do que é um filme e quais informações um filme deve ter. Abrindo o arquivo "movie.dart", temos acesso à classe Movie, onde consta as informações de nome, classificação, duração, sinopse, gênero, imagem e sessões disponíveis para o filme.

Na pasta "screens" estão as nossas telas da aplicação, que são 3: home, checkout e movie screen. Para termos uma noção, "home.dart" se trata da tela inicial, assim que a aplicação é aberta. Clicando em algum filme, temos acesso à página implementada em "movie_screen.dart", onde vemos as informações do filme escolhido. Ao clicar em uma sessão do filme, somos direcionados à página de checkout, onde podemos comprar o ingresso para o filme e sessão selecionados.

Na penúltima pasta, "services", temos o arquivo "movies_api.dart", onde acessamos a API de filmes, ou seja, a listagem de filmes que vamos carregar e mostrar para a pessoa usuária dentro da aplicação. Além disso, há também os métodos que serão usados para chamar e carregar as informações da API.

Por fim, na pasta "themes", temos o arquivo "my_themes.dart", onde constam dois dicionários com as informações de cores para os diferentes gêneros de filme. Ou seja, para cada gênero, temos o retorno de um tema construído a partir das cores selecionadas.

Agora, podemos pensar nas futures de devemos implementar.

Futures
Uma das nossas tarefas é preencher a tela de home com os dados da API utilizando gerenciadores de estado. Além disso, faremos um filtro baseado no gênero do filme.

No topo da aplicação, temos um menu drop-down para selecionar os diferentes gêneros do filme. Dessa forma, a ideia é que apareçam somente os filmes do gênero selecionado a partir deste menu.

Na última tarefa, ao clicar em um filme, o tema e a coloração da aplicação devem mudar de acordo com o gênero do filme selecionado. No caso de um filme de suspense, por exemplo, o tema da aplicação deve ser escuro, com cores vermelhas.

Vale ressaltar que as cores e temas já foram pré-definidos no arquivo "my_themes.dart", então nosso trabalho é apenas implementar a future responsável por mudar a cor da aplicação.

No total, temos 3 futures para implementar. A seguir, começaremos a desenvolver a future de carregar os filmes da API e mostrá-los em nossa home!

@@04
Lógica e o padrão BLoC

Vamos iniciar nossa future de carregar informações da API e mostrá-las em nossa home page.
Até então, temos informações fixas na home. Na linha 43 do arquivo "home.dart", estamos preenchendo as informações necessárias para o MovieCard existir e criando um objeto movie manualmente:

return MovieCard(movie: Movie(name: "James Bond", classification: Classification.naoRecomendado12, duration: "1h 22min", sinopse: "James Bond é um agente", genre: "Suspense", imageURI: null, sessions: ["18:00"]));
                },COPIAR CÓDIGO
Note que as informações do filme também foram criadas manualmente, mas o ideal é que as carreguemos de outro local.

Para fazer a atualização de estado da tela depois de carregar as informações, usaremos a ferramenta BloC que, além de ser um gerenciador de estado, também é um padrão de projeto.

O desafio: vamos conhecer a tela do projeto
Primeiro, precisamos conhecer a tela home, que deve ser preenchida com informações vindas da API.

Sendo assim, faremos uma requisição à API e preencheremos as informações na home.

Os estados da tela home
O primeiro estado da home é quando as informações da API estãos carregando. Portanto, precisamos dar um feedback à pessoa usuária informando que os filmes estão sendo carregados.

Outro estado importante é quando os filmes já estão carregados e aparecem listados na tela.

Um terceiro estado representa erro no carregamento, que se dá quando há um problema na comunicação com a API. Portanto, a pessoa usuária também precisa ser alertada sobre esta falha.

Por enquanto, temos 3 estados.

Onde vai ficar a lógica?
Para fazer a requisição, precisamos de um future builder, onde deve constar a lógica responsável por chamar a API com as informações, construir um objeto com a lista de filmes e preenchê-la com os movies cards.

No projeto, as responsabilidades estão separadas em pastas: "components", "models", "screens", "services" e "themes". Podemos chamar essas pastas de camadas e cada uma terá uma responsabilidade.

A pasta "services", por exemplo, fará a requisição da API; "themes" cuidará da estilização da aplicação; "models" contém os modelos que representam alguma informação; "components" refere-se aos componentes; e "screens" armazena as nossas telas, onde ficarão as informações carregadas e renderizadas para a pessoa usuária.

A lógica do future builder, responsável por transformar as informações em uma lista e iterar sobre os itens, poderia ficar na tela home. Porém, considerando a separação de camadas do projeto, será que faz sentido armazenar a lógica dentro de um arquivo responsável por simplesmente mostrar a informação?

Pensando nisso, temos o BloC, que nos apresenta outra camada, a de lógica, onde toda a funcionalidade de pegar as informações e tratá-las, fica separada dentro de outro arquivo.

Veremos essa estrutura mais adiante, porque, agora, vamos instalar o BloC.

No arquivo "pubspec.yaml", na raiz total do projeto, temos as linhas 38 e 39 que adicionam duas linhas na dependência do flutter: o bloc e o flutter_bloc.

bloc: ^8.1.1
flutter_bloc: ^8.1.2COPIAR CÓDIGO
O instrutor já deixou as duas dependências instaladas no projeto. Mas, caso você queira fazer por conta própria ou implementar em outro projeto, é importante adicioná-las nas dependências.

Para este curso, é muito importante utilizar a mesma versão adotada pelo instrutor, assim temos consistência no desenvolvimento do projeto. São elas: o BloC na versão 8.1.1 e o Flutter BloC na versão 8.1.2.

Instaladas as dependências, podemos usar o BloC na aplicação!

@@05
Entendendo o problema

Você faz parte de uma equipe que recebeu a demanda para construir um app de compra de ingressos - o Bilheteria Panucci. Para garantir um fluxo eficiente de informações entre as telas do projeto, é necessário utilizar um gerenciador de estado.
Na tela inicial do aplicativo, são previstos quatro estados diferentes:

O Inicial, quando a tela está vazia;
O de carregamento;
O de sucesso; e
O de erro.
Analisando o projeto, você notou que já existem algumas camadas que cuidam de tarefas específicas, como a manipulação dos dados nos bastidores e o design do layout da tela, conforme imagem abaixo:

Contudo, Renata, uma colega de equipe, está com algumas dúvidas em relação à implementação e organização do projeto. E para ajudá-la, selecione as informações verdadeiras:

O BLoC fornece uma nova camada de responsabilidade do projeto: a camada de lógica que organiza, cuida e gerencia dos possíveis estados de todas as telas do aplicativo.
 
Alternativa correta
A pasta screens cuida de toda a “camada visual” do projeto, ou seja, desde armazenar os componentes até desenhá-los na tela do aplicativo.
 
Alternativa correta
A camada de lógica, que envolve os estados da tela e a requisição e tratamento de dados vindos de uma API, fica melhor encaixada na pasta Screens, já que ela vai mostrar as informações dos filmes.
 
Alternativa correta
O BLoC fornece uma nova camada de responsabilidade do projeto Flutter: a camada de lógica que organiza, cuida e gerencia os possíveis estados da tela Home (a tela inicial do app) e também lida com os dados da API que contém informações dos filmes.
 
É isso mesmo! A maior vantagem do BLoC é isolar o código que lida com as “regras lógicas” do projeto. Por exemplo, se houver erro, é preciso mostrar um estado de tela que informe o problema ao usuário; da mesma forma, se as informações forem pegas da API e carregadas corretamente, precisamos mostrá-las em tela!

@@06
Os estados da home

Temos várias pastas representando as várias camadas da aplicação, mas nenhuma é para a lógica. Pensando nisso, dentro da raiz do projeto, na pasta "lib", criaremos uma pasta chamada "logic". Dentro de "logic" criaremos uma outra pasta chamada "cubit".
Lembre-se que, até então, nossa home deve ter 3 estados:

Carregamento: quando as informações da API estãos carregando. Portanto, precisamos dar um feedback à pessoa usuária informando que os filmes estão sendo carregados;
Sucesso: quando os filmes já estão carregados e aparecem listados na tela;
Erro: quando há um erro no carregamento, que se dá por um problema na comunicação com a API. Portanto, a pessoa usuária também precisa ser alertada sobre esta falha.
Há, porém, um quarto estado que costuma ser invisível: o estado inicial da home, onde nada foi feito, o widget está sendo carregado e ainda foi iniciada a busca pelas informações da API.

Com os 4 estados em mente, vamos criar um arquivo dentro de "cubit" chamado "home_states.dart", que será responsável por esses estados. Vamos começar a implementá-los!

Primeiro, criaremos uma classe abstrata chamada HomeStates. Ela será abstrata porque vai ser implementada em cada um dos estados da home. Além disso, cada estado será representado por uma classe que herdará de HomeStates:

abstract class HomeStates {}COPIAR CÓDIGO
HomeInitial será a classe do estado inicial da tela; HomeLoading, do estado de carregamento; HomeSuccess, da tela de sucesso; e HomeError para o estado de erro.

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {}

class HomeError extends HomeStates {}COPIAR CÓDIGO
Para a lógica, criaremos um arquivo chamado "home_cubit.dart", ainda dentro de "logic". Vale ressaltar que ambos os arquivos, "home_states.dart" e "home_cubit.dart", serão parte de uma mesma coisa. O dart nos permite indicar que são um só utilizando o part.

Para isso, no arquivo "home_cubit.dart", chamamos part e passamos 'home_states.dart'.

part 'home_states.dart';COPIAR CÓDIGO
Em "home_states.dart", no topo do arquivo, adicionamos part of e chamamos 'home_cubit.dart'.

part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {}

class HomeError extends HomeStates {}COPIAR CÓDIGO
Com isso, indicamos que os dois arquivos são parte de uma coisa só.

De volta a "home_cubit.dart", começaremos a escrever nossa lógica. Para isso, criaremos uma classe chamada HomeCubit.

Se quisermos utilizar o cubit, precisamos herdar as informações que existem dentro dele. Por isso, quando trabalhamos com as nossas dependências dentro de "pubspec.yaml", chamamos duas dependências: o bloc e o flutter_bloc. O primeiro deve ser usado apenas na lógica, enquanto o segundo é para ser utilizado apenas no visual, ou seja, na parte flutter da aplicação.

Para fazer "home_cubit.dart", estamos utilizando a lógica da aplicação. Ao colocar Cubit após HomeCubit, temos duas opções de importação, e devemos selecionar o pacote bloc.dart e não flutter_bloc.dart. Esteja atento a isso!

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit CubitCOPIAR CÓDIGO
Agora, podemos dizer o tipo de informação que queremos tratar em HomeCubit, que são os estados da home. Então podemos tipar como <HomeStates>. Além disso, precisamos informar que vai extender de Cubit, por isso adicionaremos o termo extends.

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> { 
}COPIAR CÓDIGO
Perceba que HomeCubit está apontando um erro. Ao posicionar o cursor sobre ela, vemos que essa superclasse não existe, o construtor não foi inicializado e não possui informações.

Para criar o construtor, passamos HomeCubit() : e chamamos o super construtor super() :, no qual passaremos a informação da representação do estado inical da aplicação: HomeInitial.

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

}COPIAR CÓDIGO
Feito isso, HomeCubit já não indica um erro.

Até agora, temos a representação de estados da tela e a primeira parte da lógica da nossa aplicação que deve fazer a busca, coletar as informações e depois mostrá-las.

A seguir, vamos entender melhor sobre o que é Cubit e BloC, e a diferença entre eles!

@@07
Faça como eu fiz: construindo a estrutura de lógica do BLoC e Cubit no projeto

Hora da prática!
Agora é a sua vez de preparar o projeto para receber o BLoC.

Mas primeiro é preciso entender algumas situações:

Como a sua estrutura do projeto foi separada (neste caso em camadas);
Analisar se a feature que será implementada precisa estar em uma nova camada;
Entender o problema que está lidando, pois existem 4 possíveis estados na tela Home.
Depois de reconhecer o problema, siga os seguintes objetivos:

Crie uma nova pasta para guardar a lógica da nossa aplicação;
Crie um novo arquivo, que será uma representação dos possíveis estados da tela Home;
Crie um novo arquivo, que irá conter toda a lógica de busca e tratamento das informações, já seguindo a estrutura mínima que o Cubit requer.
Vamos lá?

Conseguiu colocar em prática o que aprendeu em aula?
Se quiser mais informações, você pode conferir o passo detalhado da implementação abaixo:

Passo 1 - Criar uma nova pasta para guardar a lógica da nossa aplicação:
Para esse objetivo, criei a pasta que representa a camada lógica na raiz da pasta lib, e chamei essa pasta de logic;
Em seguida, dentro da pasta logic, criei outra pasta para guardar os arquivos de Cubit. E chamei essa pasta de cubit.
Passo 2 - Criar um novo arquivo que será uma representação dos possíveis estados da tela Home:
Dentro da pasta cubit, criei um novo arquivo chamado home_states.dart;
Neste arquivo, criei uma classe abstrata HomeStates;
Depois, criei uma classe para cada possível estado da Home:
HomeInitial;
HomeLoading;
HomeSuccess;
HomeError.
Lembrando que cada uma das classes precisa herdar de HomeStates.
Passo 3 - Criar um novo arquivo que irá conter toda a lógica de busca e tratamento das informações:
Dentro da pasta cubit, criei um novo arquivo chamado home_cubit.dart;
Aqui temos um ponto de atenção: embora tenha criado 2 arquivos, a ideia é que eles sejam partes de uma única feature;
Para dizer que os dois arquivos são “unidos”, utilizei as diretivas part e part of;
No arquivo home_states.dart, usei a diretiva part of 'home_cubit.dart' no topo do arquivo;
No arquivo home_cubit.dart, usei a diretiva part 'home_states.dart' no topo do arquivo;
Ainda no arquivo home_cubit.dart, criei uma classe chamada HomeCubit que irá estender de Cubit. Muita atenção para importar do pacote bloc/bloc.dart;
Antes de começar a escrever o corpo da classe, é importante dizer o tipo de informação que estamos lidando para o Cubit. Então, é preciso tipar o Cubit com a classe HomeStates;
Agora, criei o construtor e super construtor;
Não recebemos nenhum valor para dentro da nossa classe, mas precisamos dizer dentro do super construtor qual é o estado inicial do nosso Cubit, chamando a instância da classe HomeInitial().
Caso queira conferir o resultado dessa aula, você pode acessar o link neste commit.

Bateu uma dúvida ou dificuldade? Chame a gente lá no fórum ou no Discord!

https://github.com/alura-cursos/3033-bloc-com-cubit/commit/c8816f8ffc2ad729a0fc7345e515f6ff9a9bb86f

@@08
Para saber mais: o poder de fusão do part

Durante o desenvolvimento de um programa, podemos nos deparar com situações em que um arquivo está crescendo ou em que desejamos organizar melhor o código dividindo-o em partes. Para isso, existem as diretivas part e part of, como vimos na nossa aplicação Bilheteria Panucci, que dividem em partes um mesmo código.
Existem algumas vantagens no uso dessas diretivas, como:

Organização de código: Pode ser útil dividir um código em arquivos, partes dele, para facilitar a navegação e compreensão do código;
Compartilhamento de código privado: Atributos privados podem ser acessados entre os arquivos, pois estão no mesmo escopo.
Que tal usarmos um exemplo novo? Temos uma biblioteca para lidar com operações matemáticas, e queremos dividir o código em partes. Assim, teremos os seguintes arquivos:

Arquivo biblioteca_matematica.dart, que vai funcionar como o arquivo principal, reunindo todas as operações dentro dele.
    // arquivo: biblioteca_matematica.dart
    library biblio_matematica;
    
    part 'adicao.dart';
    part 'subtracao.dart';
    
    void print() {
      print('Bem vindo a biblioteca de matemática!');
    }
COPIAR CÓDIGO
Arquivo adicao.dart, que vai tratar apenas da operação de adição.
    // arquivo: adicao.dart
    part of 'biblioteca_matematica.dart';
    
    int add(int a, int b) {
      return a + b;
    }
COPIAR CÓDIGO
Arquivo subtracao.dart, que vai tratar apenas da operação de subtração.
    // arquivo: subtracao.dart
    part of 'biblioteca_matematica.dart';
    
    int sub(int a, int b) {
      return a - b;
    }
COPIAR CÓDIGO
Acima temos três arquivos diferentes, em que adicao.dart e subtracao.dart fazem parte do arquivo operacoes.dart, e todos os arquivos podem acessar as funções e as variáveis um do outro, como se estivessem no mesmo arquivo!

Mas qual é a diferença entre usar part/part of e import? Em que situações eu devo usar import? Ao contrário do part/part of, o import permite que diversos arquivos tenham acesso a um mesmo arquivo sem que haja interferência, já que eles não compartilham o mesmo escopo.

Na maioria das vezes, o ideal é utilizar import. Essa prática torna o código mais modular e facilita o entendimento, pois cada arquivo mantém seu próprio escopo. O uso de part/part of deve ser reservado para casos em que você precisa dividir uma biblioteca em múltiplos arquivos, mas ainda assim deseja que todos esses arquivos compartilhem o mesmo escopo.

Legal, não é? Agora que você entendeu como funcionam essas diretivas, pode usar quando for necessário e fizer sentido para o seu projeto.

@@09
O que aprendemos?

Nessa aula, você aprendeu como:
Compreender as features, desafios e necessidades do projeto Bilheteria Panucci;
Entender a importância da divisão de responsabilidades no projeto e qual função de cada uma das pastas, incluindo a nova camada de lógica que será gerenciada com ajuda do BLoC;
Construir a estrutura básica e mínima para começar a utilizar o BLoC com Cubit, utilizando uma classe abstrata e quatro classes comuns;
Utilizar as diretivas part e part of para unir dois arquivos diferentes: o primeiro arquivo (home_cubit.dart) com a lógica de gerenciamento de estados da tela Home e o segundo arquivo (home_states.dart) com os estados da tela Home.
Começamos o curso muito bem, construindo o código básico de um Cubit!

Continuamos a feature na próxima aula, vejo você lá!

#### 21/11/2023

@02-O Cubit e a tela Home

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/3033-bloc-com-cubit/archive/refs/heads/Aula1.zip

@@02
Entendendo melhor o Cubit

Vamos recapitular rapidamente o que fizemos na aula passada, começando pelo arquivo home_states.dart. Nele, temos uma representação de quais seriam os estados da nossa tela Home:
part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {}

class HomeError extends HomeStates {}COPIAR CÓDIGO
De início, temos uma classe abstrada chamada HomeStates, que será a representação total de cada um dos estados. Em seguida, temos os estados HomeInitial, HomeLoading, HomeSuccess e HomeError, que são classes que representam os possíveis estados da tela Home.

HomeInitial será o estado inicial, em que nada foi carregado, assim que abrimos a aplicação. HomeLoading representa o estado de carregamento de informações da API. HomeSuccess é aplicado quando conseguimos recuperar todos os dados e mostrá-los na tela para a pessoa usuária. HomeError será o estado de erro, quando ocorre alguma falha, como um problema no carregamento de dados da API.

A seguir, vamos conferir o arquivo home_cubit.dart:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

}COPIAR CÓDIGO
Nele, criamos uma classe chamada HomeCubit que representa um Cubit em nosso aplicativo. Ele estende de Cubit<>. Nós já definimos o tipo de Cubit com o qual trabalharemos, ou seja, o tipo do estado com o qual lidaremos: o HomeStates — a representação dos possíveis estados que a tela terá. Depois, criamos um construtor HomeCubit com o superconstrutor passando qual o estado inicial, no caso, HomeInitial.

Ao criar um Cubit, precisamos definir o tipo de estado com o qual ele lidará, seja um número inteiro ou uma string. Essa informação é muito importante para que, ao alterar o estado, não modifiquemos um número por outro objeto, por exemplo, de modo que o sistema terá dados inconsistentes. Ao tipar o Cubit, garantimos que lidaremos com o mesmo tipo de informação.

O HomeCubit lidará com os estados da aplicação, portanto, ao tipar nosso Cubit, é importante que ele respeite esse padrão e seja um estado.

Nesse arquivo, temos o construtor HomeCubit() e o superconstrutor com o HomeInitial inicializado. O "super" é onde passaremos qual é o estado inicial do Cubit, o que é uma informação essencial.

Por exemplo, se o estado inicial fosse uma número inteiro, teríamos que trocar o tipo do Cubit de <HomeStates> para <int> e passar um número inteiro em super():

// CÓDIGO DE EXEMPLO

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

}COPIAR CÓDIGO
Nesse cenário, o HomeCubit tem como estado inicial o valor inteiro igual a 0.

Outra opção seria seria inicializar por meio do construtor. Em vez de toda instância de HomeCubit terem o mesmo estado inicial, poderíamos alterá-los, passando pelo construtor. Por exemplo:

// CÓDIGO DE EXEMPLO

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit(int valor) : super(valor);

}COPIAR CÓDIGO
Não é isso que queremos fazer no momento, então vamos manter o código como estava ao final da última aula, com o tipo `HomeStates:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

}COPIAR CÓDIGO
Para alterar o valor dos estados, criaremos funções. É importante ressaltar que as funções que vão alterar o estado do Cubit não tem retorno, todas elas serão void.

Mas por que alteramos o estado do HomeCubit? Para entender melhor, vamos supor que temos uma função chamada mudaEstado():

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  void mudaEstado() {

  }

}COPIAR CÓDIGO
Para alterar o estado, utilizaremos a função emit(), passando um valor novo ou devolvendo o estado atual:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  void mudaEstado() {
    emit(state);
  }

}COPIAR CÓDIGO
Nesse caso, a variável state que ele mesmo criou é uma representação do estado atual do Cubit. Essa explicação pode ser um pouco confusa, então vamos revisar a seguir.

Na linha 6, temos o construtor que foi inicializado com HomeInitial. O estado atual do Cubit é HomeInitial. Chamando a função mudaEstado(), temos a função emit() com a variável state. Como não houve nenhuma mudança em state, ela é o estado inicial. Ou seja, receberíamos o HomeInitial.

Se quisermos trocar para outro estado, trocaremos o state para HomeLoading, por exemplo:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  void mudaEstado() {
    emit(HomeLoading);
  }

}COPIAR CÓDIGO
Agora, o estado será HomeLoading, de carregamento. Ou seja, por meio dessas funções e da função emit(), conseguimos alterar o estado do B.L.O.C.

Dessa forma, entendemos alguns conceitos do funcionamento do Cubit. Nosso próximo passo será colocar esses conhecimentos em prática para criar a função que responsável pela busca da API e alteração o estado do HomeCubit para cada um dos diferentes estados. Ou seja, teremos o HomeInitial em que nada acontece, pois é o estado inicial. Em seguida, passaremos pelo HomeLoading e HomeSuccess (no caso de sucesso) ou HomeError (no caso de erros).

@@3
Para saber mais: BLoC ou Cubit? A melhor abordagem para o seu projeto

Durante a aula, exploramos dois termos relevantes: BLoC e Cubit. É importante compreender claramente cada um deles. Vamos lá!
BLoC, que significa Business Logic Object Components (em português, Componentes de Objetos de Lógica de Negócio), é um padrão amplamente utilizado no Flutter para separar as regras de negócio (que determinam o funcionamento da aplicação) da interface do usuário (aquilo que o usuário vê e com o qual interage).

Já o Cubit é um subconjunto do BLoC que oferece uma abordagem simplificada para o gerenciamento de estados.

O BLoC é mais poderoso e possui uma gama mais ampla de funcionalidades, enquanto o Cubit, como um subconjunto do BLoC, possui menos recursos, porém é mais simples de usar. Portanto, recomenda-se o uso do Cubit para problemas mais simples e, se necessário, migração para o BLoC.

Para entender as diferenças de forma mais técnica, o BLoC possui dois conceitos-chave: eventos e estados. Ao disparar um evento (apertar um botão, um gesto ou condições específicas) o estado da aplicação deve mudar. Por outro lado, no Cubit, lidamos apenas com estados.

Em resumo, ambos podem ser utilizados em projetos, inclusive neste curso. No entanto, o Cubit é mais fácil de implementar, pois não lida com eventos. Pensando que a aprendizagem fica mais fácil começando do conhecimento mais simples, vamos utilizar bastante o Cubit neste curso.

Caso tenha interesse, pode também consultar a documentação para o BLoC/Cubit para mais detalhes.

https://www.alura.com.br/artigos/o-que-sao-regras-de-negocio?_gl=1*1cxtz4m*_ga*MTgwMzIzMjk2Ni4xNjg4ODE5OTcz*_ga_1EPWSW3PCS*MTcwMDYwNDM0My4xMTEuMS4xNzAwNjA3NDM5LjAuMC4w*_fplc*RVBXaVBZZnVheEMxVnBkdVdjUkNrd3VlJTJGSWQ3VlRaUzVKUUtOaGdnRjRiSTB0ZHczS1c4SlRYMTBZcENzT3hmUFFTS1ZWWUU5eUFHNkhBOTBoV2NvR3dZUGElMkJqY2clMkJ0Z2ZGYWlGNW5YV08lMkZBaSUyQiUyRndYQUJIMWtRa3VmSTRRJTNEJTNE

https://pub.dev/packages/bloc

@@04
Montando a lógica de busca com Cubit

Agora que entendemos os conceitos para fazer a mudança de estado, vamos criar nossa própria função que alterará o estado do HomeCubit para cada um daqueles estágios listados no arquivo home_states.dart.
Como queremos fazer a busca para a API, o primeiro passo será criar uma função assíncrona Future<>, com o tipo void, pois não temos retorno. Essa função se chamará getMovies():

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  Future<void> getMovies() async {

  }

}COPIAR CÓDIGO
Após o HomeInitial, temos o HomeLoading, depois o HomeSuccess ou o HomeError, caso haja algum erro. Para alterar de HomeInitial para HomeLoading, usaremos a função emit(), passando o estado HomeLoading:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  Future<void> getMovies() async {
    emit(HomeLoading());
  }

}COPIAR CÓDIGO
Agora, o Cubit sabe que, ao chamar a função GetMovies(), inicialmente alteraremos o estado para HomeLoading. O próximo passo é fazer a busca, ação já definida no arquivo movies_api.dart. Basta criar uma instância de HomeService e chamar a função fetchMoveis(). Através da response, o retorno será a lista de filmes.

Primeiramente, criaremos a instância, chamada homeService:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
  }

}COPIAR CÓDIGO
Dentro da função getMovies(), declararemos uma variável chamada movies, que armazenará o retorno de fetchMovies(). Como estamos lidando com uma função assíncrona, usaremos a palavra await:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    final movies = await homeService.fetchMovies();
  }

}COPIAR CÓDIGO
Para lidar com possíveis erros nesse processo de busca na API, vamos construir um bloco try/catch. Dentro do bloco try, tentaremos buscar a lista de filmes e, se tudo der certo, chamaremos o emit() para alterar o estado para HomeSuccess:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess());
    } catch(e) {

    }
  }

}COPIAR CÓDIGO
No bloco catch, vamos emitir o estado HomeError:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess());
    } catch(e) {
      emit(HomeError());
    }
  }

}COPIAR CÓDIGO
Assim, na função getMovies, já fizemos referências aos quatro possíveis estados da tela Home. Na linha em que declaramos a variável movies, a IDE indicará um ponto de atenção. Essa variável não está sendo usada. O HomeSuccess ainda não está recebendo movies!

Para entender melhorar, vamos voltar ao home_states.dart. As classes definidas nesse arquivo são representações dos estados e elas podem conter informações. A classe HomeSuccess, por exemplo, pode ter uma lista de filmes!

Vamos desenvolver um construtor de HomeSuccess, que receberá this.movies. Em seguida, criaremos uma instância final List<Movie> movies:

// ...

class HomeSuccess extends HomeStates {
  HomeSuccess(this.movies);

  final List<Movie> movies;
}

// ...COPIAR CÓDIGO
Agora, a classe tem uma lista de filmes! Quando estivermos no estado de HomeSuccess, teremos uma lista. Após salvar esse arquivo, vamos voltar ao home_cubit.dart e passar a variável movies para HomeSuccess():

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } catch(e) {
      emit(HomeError());
    }
  }

}COPIAR CÓDIGO
Quanto ao HomeError, podemos imprimir uma string customizada e amigável para a pessoa usuária:

import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } catch(e) {
      emit(HomeError('Não foi possível carregar a lista de filmes!'));
    }
  }

}COPIAR CÓDIGO
No arquivo home_states.dart, precisaremos indicar que a classe HomeError recebe uma string no construtor:

// ...

class HomeError extends HomeStates {
  HomeError(this.error);

  final String error;
}

// ...COPIAR CÓDIGO
Assim, dentro do objeto HomeSuccess, temos a lsita de filmes. Já dentro da classe HomeError, consta a mensagem de erro. Com todas essas informações prontas, nosso próximo passo será consumiar dentro do Flutter, a parte visual da nossa Home.

@@05
Faça como eu fiz: busca com Cubit

Hora da prática!
Nessa aula, aprendemos a criar uma função assíncrona chamada getMovies que vai alterar o estado da tela Home emitindo estados (HomeLoading, HomeSuccess ou HomeError) ao fazer a busca por uma lista de filmes.

Agora é a sua vez de montar a lógica dos arquivos Cubit. Para fazer isso, siga os seguintes passos:

Passo 1: Crie a função que vai devolver para a tela, a lista de filmes (lembrando que ela precisa ser uma função assíncrona);
Passo 2: Dentro dessa função, altere o estado atual do Cubit de inicial para carregando;
Passo 3: Agora carregue a lista de filmes da classe HomeService através da função fetchMovies()e salve em uma lista de filmes;
Passo 4: Se tudo der certo, atualize o estado para sucesso e mande a lista de filmes para a classe HomeSuccess;
Passo 5: Se nada der certo, atualize o estado para erro e mande uma mensagem de erro para a classe HomeError.
É muito importante que você faça as adaptações necessárias para receber a lista de filmes e a mensagem de erro nas classes de estados.

Vamos lá?

Conseguiu colocar em prática o que aprendeu em aula?
Se quiser mais informações, você pode conferir o passo detalhado da implementação abaixo:

1) Criação do método getMovies() na classe HomeCubit:

O método getMovies() é assíncrono e não retorna um valor (Future<void>);
Dentro do método, ele emite o estado HomeLoading() para indicar que a lista de filmes está sendo carregada;
Em seguida, chamamos o método fetchMovies() do serviço homeService para buscar os filmes e armazenar o resultado na variável final movies;
Para validar se a busca for bem-sucedida, vamos utilizar um try catch;
Se a busca for bem-sucedida, ele emite o estado HomeSuccess com os filmes obtidos;
Caso ocorra uma exceção, ele emite o estado HomeError com uma mensagem de erro:
    Future<void> getMovies() async {
      emit(HomeLoading());
      try {
        final movies = await homeService.fetchMovies();
        emit(HomeSuccess(movies));
      } catch(e) {
        emit(HomeError('Não foi possível carregar a lista de filmes!'));
      }
    }COPIAR CÓDIGO
2) Vamos adaptar a classe HomeSuccess:

A classe HomeSuccess agora possui um construtor que recebe uma lista de filmes e armazena-a na propriedade movies:
    class HomeSuccess extends HomeStates {
      HomeSuccess(this.movies);

      final List<Movie> movies;
    }COPIAR CÓDIGO
3) Por último, a classe HomeError:

A classe HomeError agora possui um construtor que recebe uma mensagem de erro e armazena-a na propriedade error.
    class HomeError extends HomeStates {
      HomeError(this.error);

      final String error;
    }COPIAR CÓDIGO
Caso queira conferir o resultado dessa aula, você pode acessar o link neste commit.

Bateu uma dúvida ou dificuldade? Chame a gente lá no fórum ou no Discord!

https://github.com/alura-cursos/3033-bloc-com-cubit/commit/e837550128e4e397118d1c39f30190a2f324f51c

@@06
Consumindo o Cubit na Home

Finalizamos toda a parte lógica do nosso Cubit. O próximo passo será mostrar essas informações na nossa tela. Então, encerramos todo o nosso assunto com o pacote de BLoC, e agora começaremos a usar o pacote Flutter BLoC, que contém as informações para mostrar algo na tela por meio do HomeCubit.
Finalizamos o home_cubit.dart, então vamos para a nossa Home no arquivo home.dart.

Em algum momento, criaremos uma instância de HomeCubit. Então, dentro da classe _HomeState, na linha 14, criaremos a instância: final HomeCubit homeCubit = HomeCubit(). Em algum momento, usaremos essa instância para pegar as informações dos estados.

home.dart
class _HomeState extends State<Home> {
  final HomeCubit homeCubit = HomeCubit();COPIAR CÓDIGO
Descendo rapidamente o nosso código, vamos tentar entender onde nossa lista está sendo construída. Na linha 38, temos um SliverGrid.builder() que contém um itemBuilder onde está o movieCard(). O movieCard() é o que aparece na nossa tela para cada cartão de filme.

Se prestarmos bem atenção, não queremos realmente desenhar toda a Home, mas redesenhar essa lista. Então, teremos que envolver esse SliverGrid com algum widget do próprio BLoC que dirá "apenas esse trecho de código precisa ser redesenhado, e não toda a aplicação". É para isso que temos o pacote de Flutter BLoC!

O SliverGrid.builder() ficará envolto de outro widget, que adicionamos clicando nele e selecionando "Wrap with widget", chamado BlocBuilder(). No autoimport, ele nos indica o pacote do qual importará esse widget: from 'package:flutter_bloc...'. Reforçando: terminamos a nossa parte lógica e agora estamos trabalhando com a parte visual.

const GenreFilter(),
BlocBuilder(
    child:SliverGrid.builder(

// código omitido

      itemBuilder: (context, index) {
        return MovieCard(movie: Movie(name: "James Bond",classification: Classification.naoRecomendado12, duration: "1h 22min", sinopse: "James Bond é um agente", genre: "Suspense", imageURI: null, sessions: ["18:00"]));
      },
      itemCount: 5,
    ),
),

//código omitido...COPIAR CÓDIGO
Ao importar esse widget, surgem alguns erros. O BlocBuilder espera um builder, e nós estamos passando um child para ele. Então, nosso primeiro passo será chamar o builder, que espera uma função anônima que recebe um context e um state.

Quais são os estado que temos disponíveis, sobre os quais precisamos trabalhar na nossa Home? Ao todo, são quatro estados. Não precisamos, necessariamente, lidar com o primeiro porque é o estado inicial da Home; quando criamos a instância, o HomeInitial já é o estado inicial do nosso Cubit.

Dessa forma, precisaremos lidar com o HomeLoading, o HomeSuccess e o HomeError. Então, vamos chamar a função anônima que nos dará um bloco de código para trabalhar:

const GenreFilter(),
BlocBuilder(
    builder: (context, state) {

    },
    child: SliverGrid.builder(

//código omitido...COPIAR CÓDIGO
O nosso primeiro estágio é o HomeLoading. Podemos criar uma condição para validar: se (if) o state atual for HomeLoading, ele nos retornará algo. Ele pode nos retornar um Center() que receberá como filho (child) um CircularProgressIndicator() para indicar o carregamento das informações:

const GenreFilter(),
BlocBuilder(
  builder: (context, state) {
    if (state == HomeLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
// código omitido...COPIAR CÓDIGO
Caso contrário (else if), vamos checar o próximo estágio. Se o state atual for HomeSuccess, ele nos retornará o nosso SliverGrid.builder(). Para isso, damos um return, removemos o child do SliverGrid e o movemos inteiro para dentro desse retorno. Depois o indentamos para organizar melhor:

// ... código omitido

    } else if (state == HomeSuccess) {
      return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisExtent: 240,
        ),
        itemBuilder: (context, index) {
          return MovieCard(
            movie: Movie(
              name: "James Bond",
              classification: Classification.naoRecomendado12,
              duration: "1h 22min",
              sinopse: "James Bond é um agente",
              genre: "Suspense",
              imageURI: null,
              sessions: ["18:00"]));
        },
        itemCount: 5,
      );
    }COPIAR CÓDIGO
Retornaremos oSliverGrid.builder, ótimo! O que tem dentro dele? Lembrando que, se o estado for HomeSuccess, ele terá alguma informação dentro. Podemos acessar a informação através do state, chamando o objeto que existe dentro dele. Ou seja, se o estado for HomeSuccess, ele deve construir a lista de filmes; não deveria parar de funcionar, por exemplo.

Por último, inserimos outro else para verificar se o estado é igual a HomeError. Não precisamos do if porque, caso não seja nenhum dos outros estados, ele cairá automaticamente no HomeError. Retornaremos uma mensagem de erro com um Center(child:) contendo um Text(), cujo valor será 'Deu erro', por enquanto:

// ... código omitido

    } else {
      return Center(child: Text('Deu erro'),);
    }COPIAR CÓDIGO
Agora, temos um retorno para todos os estados possíveis. Vamos salvar o código.

Ao salvar, recebemos um erro: ProvideNotFoundException(). Isso aconteceu porque o nosso BlocBuilder() não está especificado, ou seja, não dissemos qual bloc ele deve usar, o estado com que ele terá de lidar, não passamos quase nenhuma informação.

Por mais que tenha o BlocBuilder(), de onde estamos buscando esse state? E se tivermos mais de um Cubit dentro da Home? Precisamos dizer para o BlocBuilder() com o que ele está trabalhando.

Então, nós iremos tipar esse BlocBuilder() assim que o chamamos, na linha 39, com as duas informações com as quais irá trabalhar. A primeira informação é a HomeCubit, para dizer com que Cubit ele vai lidar, e HomeStates, para dizer com quais estados ele vai lidar: BlocBuilder<HomeCubit, HomeStates>.

Mas, só isso não resolve totalmente o nosso problema. É importante passar outra informação também, por meio da propriedade bloc. Ela recebe a referência de algum bloc ou Cubit. Nós já criamos uma instância dele lá no começo do nosso arquivo: homeCubit.

const GenreFilter(),
BlocBuilder<HomeCubit, HomeStates>(
  bloc: homeCubit,
  builder: (context, state) {
    if (state == HomeLoading) {

// código omitido...COPIAR CÓDIGO
Vamos salvar o arquivo novamente e recarregar a aplicação.

Agora, recebemos outro erro: FluterError.fromParts<DiagnosticsNode>. Isso aconteceu porque passamos um tipo errado de render.

Estamos trabalhando com um CustomScrollView(), que não recebe diretamente o widget Center() que colocamos no retorno de HomeLoading. Precisamos abraçá-lo com um widget chamado SliverFillRemaining()

Não precisamos fazer isso com o Grid, porque já é um SliverGrid. Por fim, faremos o mesmo com o Center() do retorno do último else:

// ... código omitido
    if (state == HomeLoading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state == HomeSuccess) {
      return SliverGrid.builder(
// código omitido...
    } else {
      return SliverFillRemaining(child: Center(child: Text('Deu erro'),));
// código omitido...COPIAR CÓDIGO
Pronto! Salvamos novamente e recarregamos a aplicação.

Ao fazer isso, a tela da aplicação no emulador exibe a mensagem "Deu erro". É o que queríamos, de fato: ver o estado acontecendo.

O erro aconteceu porque ainda não chamamos a nossa função que recarrega e muda os estados. Então, o único estado que ele tem disponível é o HomeInitial. No entanto, o HomeInitial não consegue bater em nenhum desses estados. Sendo assim, o retorno do último else é o que ele consegue exibir, porque é a exceção.

Nosso próximo passo, então, será chamar a função que muda os estados e, depois, lidar com as informações que estamos recebendo dentro da nossa API.

Nos encontramos no próximo vídeo!

@@07
Para saber mais: StatefulWidget ou StatelessWidget?

As classes StatelessWidget e StatefulWidget são dois tipos fundamentais de widgets no Flutter. Um StatelessWidget, como o nome sugere, é um widget que não muda - é imutável. Isso significa que, uma vez definido, sua interface de usuário permanece a mesma ao longo do tempo.
Por outro lado, um StatefulWidget é um widget que pode mudar - é mutável. Ele possui um estado interno que pode ser alterado durante a execução do aplicativo.

Você pode se perguntar: "Eu poderia ter usado o StatefulWidget em vez do Cubit neste aplicativo?"

A resposta é sim. O StatefulWidget tem uma função chamada setState que é usada para informar ao Flutter que o estado interno do widget mudou e que a interface do usuário precisa ser atualizada.

No entanto, utilizar um StatefulWidget não é a mesma coisa que utilizar um gerenciador de estado, como o Cubit. Com um StatefulWidget, quando setState é chamado, toda a interface do usuário do widget é reconstruída. Já com o Cubit, apenas os widgets que precisam ser atualizados são reconstruídos, o que pode melhorar a performance do aplicativo.

Na nossa Home, apontamos para o Flutter quais widgets precisam ser redesenhados através do widget BlocBuilder. Esse BlocBuilder funciona como um StatefulWidget interno, ou seja, utilizando o BlocBuilder, não precisamos chamar a função setState(). Como não precisamos chamar o setState(), a Home não precisa ser necessariamente um StatefulWidget.

Por fim, você pode ter notado que criamos a nossa Home como um StatefulWidget. No entanto, isso não é estritamente necessário. Na verdade, você poderia substituí-lo por um StatelessWidget sem problemas!

@@08
Utilização do Cubit

Você está desenvolvendo um aplicativo de lista de tarefas. Ao adicionar uma nova tarefa, você precisa atualizar o estado do Cubit para refletir a adição da tarefa e, consequentemente, exibir a nova tarefa na tela.
Considerando o uso de Cubit em uma aplicação Flutter, selecione a alternativa que traz qual é a forma correta de atualizar o estado do Cubit ao adicionar uma nova tarefa e refletir as mudanças na tela?

Atribuir diretamente o novo estado à propriedade state do Cubit e atualizar a tela usando setState().
 
Alternativa correta
Chamar emit() no Cubit com o novo estado e envolver o widget que deverá ser atualizado com o BlocBuilder.
 
Para atualizar o estado do Cubit e refletir as mudanças na tela, é necessário chamar o método emit() no Cubit, passando o novo estado como parâmetro. Além disso, é preciso dizer qual trecho de código precisa ser atualizado, utilizando o widget BlocBuilder.
Alternativa correta
Criar uma nova instância do Cubit com o novo estado e atualizar a tela usando setState().
 
Alternativa correta
Chamar emit() no Cubit com o novo estado e deixar o Cubit automaticamente atualizar a tela.

@@09
Mostrando a lista de filmes na Home

Nossa aplicação carrega automaticamente na tela de "Deu erro" porque o único estado que ela tem dentro dela é o Initial, e não temos nada nesse estado. portanto, caímos diretamente no nosso else final, da linha 65, retornando essa mensagem de erro.
Isso acontece porque falta chamar a nossa função getMovies() dentro do Cubit, a função que realmente alterará os estados da nossa Home. Mas, em que momento queremos alterar os estados? Em que momento queremos carregar a nossa lista de filmes?

Queremos que a pessoa abra o aplicativo e essa lista de filmes já seja carregada. Para isso, podemos chamar a nossa função no estado mais inicial do nosso widget de _HomeState: dentro da função initState().

Ou seja, ao começar a desenhar o widget, ele também começará a alterar os estados dentro desse _HomeState. Então, escrevemos: homeCubit.getMovies(). Teremos:

home.dart
@override
void initState() {
  homeCubit.getMovies();
  super.initState();
}COPIAR CÓDIGO
Vamos salvar o arquivo e verificar o resultado que aparece na tela da aplicação no simulador. Continuamos na mensagem "Deu erro". Vamos tentar debugar o que está acontecendo.

Daremos um print() logo no início do nosso builder para imprimir o estado (state) em que estamos:

const GenreFilter(),
  BlocBuilder<HomeCubit, HomeStates>(
    bloc: homeCubit,
    builder: (context, state) {
            print(state);
// código omitidoCOPIAR CÓDIGO
Vamos salvar o arquivo e verificar o Debug Console. Ele nos retorna que estamos em uma instância de HomeSuccess:

Instance of 'HomeSuccess'
Ou seja, o state está em HomeSuccess. Se carregarmos novamente, veremos que primeiro estamos numa instância de HomeLoading e depois HomeSuccess:

Instance of 'HomeLoading'
Instance of 'HomeSuccess'
Então, por que a tela ainda exibe a mensagem de erro?

Encontramos esse problema porque, por mais que ela realmente esteja identificando o estado de HomeLoading e HomeSuccess, o nosso comparador está errado. Estamos usando state == HomeLoading, por exemplo, mas isso não funciona porque o primeiro valor é uma instância e o segundo é outra representação.

O ideal, então, seria usar o is no lugar de ==. Vamos trocar todas as ocorrências:

// ... código omitido
    if (state is HomeLoading) {
// código omitido...
    } else if (state is HomeSuccess) {
// código omitido...COPIAR CÓDIGO
Podemos apagar nosso print(), salvar o arquivo e recarregar a aplicação. Agora, ele está carregando novamente a nossa lista de filmes! Essa não é a nossa lista real de filmes, mas, pelo menos, isso quer dizer que caímos no HomeSuccess.

Agora, vamos alterar o retorno do MovieCard(). Nós temos apenas um filme, e queremos que o retorno de movie seja a nossa lista de filmes na posição da iteração que estiver acontecendo dentro do SliverGrid.builder.

Então, substituiremos todo o objeto Movie() que criamos à mão, com os dados do filme "James Bond", pela lista advinda do nosso estado de HomeSuccess. Para isso, pegaremos um state.movies[] na posição do index, resultando em: state.movies[index]. Com isso, podemos fechar nosso movieCard():

Agora, precisamos apenas ajustar o itemCountque está como 5, um número fixo, e na verdade precisamos pegar o state.movies.length():

itemBuilder: (context, index) {
    return MovieCard(
        movie: state.movies[index]);
},
itemCount: state.movies.length,
),COPIAR CÓDIGO
Podemos salvar o arquivo. Agora, recarregando a aplicação, ele pega toda a nossa lista de filmes:

emulador do Android exibindo a tela "Filmes", numa grade de três linhas por duas colunas, são exibidos os seguintes filmes com suas respectivas capas e títulos: Inception, Forrest Gump, Pulp Fiction, The Godfather, Fight Club, The Shawshank Redemption.

Se continuarmos rolando a tela para baixo, continuam a aparecer outros filmes!

Bacana. Vamos reiniciar toda a aplicação para tentar pegar o CircularProgressIndicator() da tela de carregamento e verificar se ele funciona. Ele aparece bem brevemente, porque o carregamento da API é rápido.

Por fim, só precisamos tratar o nosso erro. Ele deve receber a nossa mensagem customizada. Então, não será o child: Center(child: Text('Deu erro),), mas um texto que receberemos do próprio estado. Também queremos deixar uma mensagem um pouco mais agradável para a pessoa usuária.

Então, ao invés de retornar um Center(), retornaremos um Column(). Esse Column() precisa de um mainAxisAlignment, que será um MainAxisAlignment.center. Ele também terá children, que será uma lista de tipo <Widget>[]:

} else {
  return SliverFillRemaining(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

      ],
    ));
}COPIAR CÓDIGO
Dentro dessa lista, nós temos duas informações. A primeira é um ícone bonito, que será um const Icon() recebendo o ícone que usaremos, o Icons.not_interested. Vamos passar um tamanho de 30 px (size: 30.0) para esse ícone também.

Em seguida, temos um espaçamento entre os elementos. Para isso, podemos usar um const SizedBox(). Sua altura será de 16 px (height: 16.00).

Por último, temos nosso texto (Text()). O texto será, justamente o nosso state.error. Esse error vai ser indicado como um erro, porque não sabe qual será o estado que vai existir.

Para corrigir isso, vamos retornar ao else e escrever else if() novamente, passando state is HomeError:

} else if (state is HomeError) {
  return SliverFillRemaining(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.not_interested, size: 30.0),
        const SizedBox(height: 16.0),
        Text(state.error),
      ],
    ));
}COPIAR CÓDIGO
Continuaremos com um erro, porque o builder precisa retornar algo. Então, no retorno final deste último if (), vamos retornar um SliverToBoxAdapter() vazio mesmo, só para dizer para ele retornar algo. Então, passamos child: Container():

return SliverToBoxAdapter(child: Container(),);
},COPIAR CÓDIGO
Pronto! Não temos mais nenhum erro ou aviso. Vamos salvar o arquivo. Mas, como testar o estado de erro?

Como brincadeira, podemos acessar o arquivo movies_api.dart e inserir um erro de digitação na nossa URL, por exemplo, tirando um "t" do "https":

movies_api.dart
class HomeService {
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(
            'htps://raw.githubusercontent.com/ikyrie/projeto_panucci_movies/main/lib/movies.json'));COPIAR CÓDIGO
Vamos salvar o arquivo e recarregar a aplicação. Ao fazer isso, é exibida a mensagem "Não foi possível carregar a lista de filmes!" com um ícone de bloqueio na tela:

emulador do Android exibindo a tela "Filmes". no centro, um ícone de bloqueio e a frase de erro.

O erro está carregando perfeitamente e recebendo a mensagem que vem do nosso estado de HomeError.

Vamos voltar para a nossa API em movies_api.dart e corrigir a URL que quebramos. Salvamos o arquivo e recarregamos a aplicação. Com isso, o CircularProgressIndicator() aparece brevemente enquanto a API é carregada e, por fim, a lista de filmes volta a ser exibida na tela.

Perfeito! Nossa primeira feature foi implementada com sucesso.

O próximo passo será implementar a feature de filtro, a qual atualizará essa lista de filmes a partir do gênero selecionado.

Nos encontramos lá!

@@10
Faça como eu fiz: implementação da lista de filmes

Hora da prática!
Em aula, abordamos como utilizar a lógica do Cubit na tela Home, focando nos estados e na lógica de carregamento da lista de filmes.

Agora é a sua vez de implementar essa feature. Siga os seguintes passos:

Passo 1: Crie uma instância de HomeCubit dentro da Home;
Passo 2: Chame a função de getMovies, dentro do initState para buscar a lista de filmes assim que a tela for iniciada;
Passo 3: Agora, usando o BlocBuilder, defina o BLoC que está usando e o tipo de estado que espera;
Passo 4: Dentro do BlocBuilder, verifique o estado do Cubit:
Se for HomeLoading: exiba uma tela de carregamento;
Se for HomeSuccess: exiba a lista de filmes;
Se for HomeError: exiba uma mensagem para o usuário informando que houve um erro;
Caso não seja nenhum desses estados, pode retornar apenas uma tela em branco.
Vamos lá?

Caso queira conferir o resultado dessa aula, ele está dividido em dois commits, que você pode acessar nos seguintes links: Consumindo o Cubit na Home e Mostrando a lista de filmes na Home.

https://github.com/alura-cursos/3033-bloc-com-cubit/commit/a5397c93723e59737372c9be6ef1a49726d25bb5

https://github.com/alura-cursos/3033-bloc-com-cubit/commit/0a515e0a8e6ece07822c90c919704e096321c94b

@@11
Desafio: implementando o Cubit no contador do Flutter

Chegou o momento colocar em prática o que aprendeu até agora e, assim, vou propor a você um desafio. E aí, topa?
Quando você estava começando a aprender Flutter, muito provavelmente criou o famoso contador (projeto que vem por padrão quando criamos uma aplicação), é o nosso "Hello, World!" no Flutter, certo?

Como sabemos, o contador utiliza StatefulWidget e o setStatepara avisar ao Flutter que a pessoa usuária apertou o FloatingActionButton e que deve atualizar a interface da aplicação.

Com base nisso, meu desafio para você é o seguinte:

Que tal viajar para o passado e usar seus novos conhecimentos em gerenciamento de estados para recriar a mesma aplicação, mas usando Cubit no lugar de StatefulWidget?

Vou te deixar algumas dicas:

Crie o Cubit para o contador;
Crie a instância desse Cubit na sua página de contador;
Chame a instância do Cubit para:
a) Notificar que ocorreu uma mudança de estado;
b) Atualizar o valor do contador na tela.
Por fim, a maior dica e conselho que posso dar:
a) Estude a documentação para entender melhor e aperfeiçoar seus conhecimentos.
Ao final, você deverá ter uma aplicação parecida com esta:

GIF colorido. Aplicação mobile desenvolvida em Flutter. Fundo branco. Na parte superior, existe uma barra de notificações do celular, e logo a abaixo um título na cor preta centralizado com o seguinte texto: “Contador com Cubit”. No centro da tela, existe um texto com a seguinte frase “Aperte o botão para adicionar +1”, e abaixo dele um valor numérico sendo incrementado constantemente, ambos na cor preta também. No canto inferior da aplicação, um botão quadrado, azul, com bordas arredondadas e um sinal de “+” no meio, ele está sendo pressionado constantemente para alterar o valor numérico do centro da tela.

Lembrando que a interface não precisa ser parecida ou igual! Apenas o funcionamento do contador. Ah, e compartilhe na nossa comunidade o resultado do seu desafio. Vamos adorar ver como ficou.

https://pub.dev/packages/flutter_bloc


E aí, conseguiu resolver o desafio? Espero que sim!
E como também gosto de desafios, vou deixar aqui o passo a passo de como fiz:

Instalei as bibliotecas bloc e flutter_bloc;
Criei um arquivo chamado counter_cubit.dart;
Em counter_cubit.dart criei uma classe CounterCubit que vai estender de Cubit e vai lidar com estados do tipo inteiro (int).
Não se esqueça de importar a biblioteca bloc/bloc.dart;
Além disso, a classe CounterCubit deve começar com valor 0 e ter uma função que faz o emit (atualiza) do estado, incrementando +1 ao estado atual:
    import 'package:bloc/bloc.dart';
    
    class CounterCubit extends Cubit<int> {
      CounterCubit() : super(0);
    
      void increment() => emit(state + 1);
    }
COPIAR CÓDIGO
Agora na tela do aplicativo, no arquivo main.dart, criei uma instância de CounterCubit:
    final counterCubit = CounterCubit();
COPIAR CÓDIGO
E para atualizar o valor do Text, criei o BlocBuilder, especificando o BLoC que queria utilizar (e não esqueça de importar a biblioteca flutter_bloc/flutter_bloc.dart):
    BlocBuilder<CounterCubit, int>(
        bloc: counterCubit,
        builder: (context, state) {
          return Text(
            state.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          );
        },
      ),
COPIAR CÓDIGO
Por fim, dentro do onPressed de floatingActionButton, chamei a função de incremento que criei usando a instância de CounterCubit:
    counterCubit.increment();
COPIAR CÓDIGO
Dessa maneira, consegui fazer o contador funcionar perfeitamente!

Se quiser conferir os arquivos da aplicação completos, vou deixá-los logo abaixo:

Arquivo main.dart:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Contador',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF041833),
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contador com Cubit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Aperte o botão para adicionar +1',
            ),
            BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterCubit.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
COPIAR CÓDIGO
Arquivo counter_cubit.dart:
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}
COPIAR CÓDIGO
Caso tenha ficado dúvidas na solução do desafio, procure nossa comunidade do Discord ou o fórum do curso.

@@12
O que aprendemos?

Nessa aula, você aprendeu como:
Identificar as diferenças entre BLoC e Cubit;
Implementar a lógica de gerenciamento de estados com um Cubit, utilizando o emit para atualizar estados;
Consumir o Cubit na tela Home, utilizando o BlocBuilder para reconstruir o estado da interface;
Mostrar os dados atualizados pelo Cubit na tela da aplicação.
Continuamos o nosso projeto na próxima aula. Encontro você lá!

