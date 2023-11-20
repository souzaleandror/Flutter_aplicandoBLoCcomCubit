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