
# Truco Scorekeeper

## Descrição

O Truco Scorekeeper é um aplicativo desenvolvido para facilitar a contagem de pontos durante o jogo de Truco. Além de registrar a pontuação de forma prática e rápida, o aplicativo salva o histórico dos jogos na nuvem, permitindo que você acesse os resultados de partidas anteriores a qualquer momento.

## Funcionalidades

- **Contagem de Pontos**: Interface intuitiva para adicionar pontos para cada equipe.
- **Histórico de Jogos**: Salva o histórico dos jogos na nuvem, permitindo revisitar partidas anteriores.
- **Interface Amigável**: Design simples e fácil de usar, ideal para todos os jogadores de Truco.
- **Sincronização na Nuvem**: Os dados são sincronizados na nuvem, garantindo que você nunca perca seu histórico de jogos.

## Tecnologias Utilizadas

- **Frontend**: React Native
- **Backend**: Node.js, Express
- **Banco de Dados**: MongoDB (com suporte para armazenamento na nuvem)
- **Autenticação**: Firebase Authentication
- **Hospedagem**: Heroku (para o backend) e Firebase (para o frontend)

## Instalação

### Pré-requisitos

- Node.js instalado
- Conta no Firebase para autenticação e armazenamento na nuvem
- Conta no Heroku para hospedar o backend

### Passos

1. Clone o repositório:
    ```sh
    git clone https://github.com/seu-usuario/truco-scorekeeper.git
    cd truco-scorekeeper
    ```

2. Instale as dependências do frontend:
    ```sh
    cd frontend
    npm install
    ```

3. Instale as dependências do backend:
    ```sh
    cd ../backend
    npm install
    ```

4. Configure o Firebase para autenticação e sincronização na nuvem. Siga as instruções no [Firebase Console](https://console.firebase.google.com/).

5. Crie um arquivo `.env` no diretório `backend` com as seguintes variáveis:
    ```
    MONGO_URI=sua_uri_mongodb
    FIREBASE_API_KEY=sua_api_key_firebase
    FIREBASE_AUTH_DOMAIN=sua_auth_domain_firebase
    FIREBASE_PROJECT_ID=seu_project_id_firebase
    FIREBASE_STORAGE_BUCKET=seu_storage_bucket_firebase
    FIREBASE_MESSAGING_SENDER_ID=seu_sender_id_firebase
    FIREBASE_APP_ID=seu_app_id_firebase
    ```

6. Inicie o backend:
    ```sh
    npm start
    ```

7. Inicie o frontend:
    ```sh
    cd ../frontend
    npm start
    ```

## Uso

1. Abra o aplicativo em seu dispositivo móvel.
2. Faça login utilizando sua conta do Firebase.
3. Comece uma nova partida de Truco e use a interface para adicionar pontos para cada equipe.
4. Veja o histórico de partidas anteriores acessando a seção de histórico do aplicativo.

## Contribuição

1. Faça um fork do repositório
2. Crie uma branch para sua funcionalidade (`git checkout -b feature/nova-funcionalidade`)
3. Faça commit das suas alterações (`git commit -m 'Adiciona nova funcionalidade'`)
4. Faça push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

- **Nome**: Seu Nome
- **Email**: seu.email@exemplo.com
- **LinkedIn**: [Seu LinkedIn](https://www.linkedin.com/in/seu-perfil)
