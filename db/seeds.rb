company = Company.create(description: "teste")
role_show = Role.create(name:"company.show", entity_id: company.id)
User.create(email: "teste@teste.com.br", roles: [role_show])


