# BD-Projeto3

Para testar a base de dados e as queries

1. Na shell "psql -h db.tecnico.ulisboa.pt -U istxxxxxx" (nao precisa de ser no sigma).
    Para sair do psql "\q"
2. Inserir password para a base de dados (pode ser diferente da do fenix).
3. Usar "\d" para ver que schemas estao presentes
4. Fazer "DROP TABLE table_name CASCADE;" das tabelas que nao fazem parte do projeto
    Para fazer DROP das tabelas do projeto (caso seja preciso fazer update dos schemas) usar "\i drop.sql"

5. Para criar as tabelas do projeto "\i entrega/schema.sql"
6. Para inserir valores nas tabelas "\i entrega/populate.sql"
