#1) Instalar como serviço:
asadmin create-service --name $Nome_dominio

#Alterar nome de exibição do serviço:
sc config domain1 DisplayName= "GlassFish 4"

#Excluir serviço:
sc delete domain1

#2) Alterar senha admin:
asadmin change-admin-password --domain_name $Nome_Dominio

#3) Habilitar Secure Admin:
asadmin --host localhost --port 5858 enable-secure-admin

--

#Criar Domínio secundário:
asadmin create-domain --adminport 5858 $Nome_dominio

#Listar Domínios:
asadmin list-domains

#Excluir Domínio:
asadmin delete-domain --domaindir ..\domains $Nome_dominio

#Para/Iniciar domínio:
start-domain $Nome_dominio
stop-domain $Nome_dominio

#Criar domínio Secundário
asadmin create-domain --adminport 5858 fundep


----

#1) Executar o cmd.exe como administrador:

#2)Acessar o diretório bin na pasta de instalação do Glassfish, por exemplo:
cd C:\glassfish40\bin

#3)Através do client administrativo do Glassfish rodar o comando "create-service", passando como parâmetro o domínio em questão(domain1, por exemplo):
asadmin create-service --name domain1

#4)Caso queira, pode-se alterar nome de exibição do serviço no Windows:
sc config domain1 DisplayName= "GlassFish 4 Domain 1"