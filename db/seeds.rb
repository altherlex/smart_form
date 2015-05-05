#encoding: utf-8

Category.create(name: "Reformas e Reparos", slug: "reformas-e-reparos").tap do |category|
  category.sub_categories.create(name: "Pintor", slug: "pintor")
  category.sub_categories.create(name: "Pedreiro", slug: "pedreiro")
end

musica_field = [
{
  order:0,
  title:"Qual é o tipo de aula?",
  type:"select",
  values:["Canto", "Piano", "Violino", "Bateria", "Violão e Guitarra", "Piano e Teclado", "Sopro", "Mixagem/DJ", "Teclado"]
},
{  
  order:1, title:"A aula será:", type:"select", values: ["Presencial", "Remota"] 
}, 
{  
  order:2, title:"Indique o nível do aluno:", type:"select", values: ["Iniciante", "Intermediário", "Avançado"] 
}, 
{
  order:3,
  title:"Indique a frequência da aula:",
  type:"select",
  values: ["Consulta única", "1x por semana", "2x por semana", "3x por semana", "Quinzenal", "Mensal"]
},
{
  order:4,
  title:"Para quando você precisa deste serviço?",
  type:"select",
  values: ["Hoje ou nos próximos dias", "Nos próximos 30 dias", "Nos próximos 3 meses", "Ainda não tenho previsão"]
},
{ order:5, title:"Informações Adicionais", type:"textarea"}]

idioma_fields = [
{
  order:0,
  title:"Qual é o idioma?",
  type:"select",
  values: ["Inglês", "Português para estrangeiros", "Outros", "Francês", "Italiano", "Espanhol", "Alemão", "Português"]
},
{  order:1, title:"A aula será:", type:"select", values: ["Presencial", "Remota"] }, 
{ order:2, title:"Informações Adicionais", type:"textarea" }
]


Category.create(name: "Aulas", slug: "aulas").tap do |category|
  category.sub_categories.create(title:"Encontre os melhores Professores de Música", name: "Música", slug: "musica", fields:musica_field)
  category.sub_categories.create(title:"Encontre os melhores Professores de Idiomas", name: "Idiomas", slug: "idiomas", fields:idioma_fields)
end
