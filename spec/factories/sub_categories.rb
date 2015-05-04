FactoryGirl.define do
  factory :sub_category do
    name "Pedreiro"
    slug "pedreiro"
  end
  factory :pedreiro, class:SubCategory do
    association :category_id, factory: :reformas_e_reparos
    name "Pedreiro"
    slug "pedreiro"
    fields [
      {
        order: 1,
        title: "Qual é o tipo de serviço?",
        type: "select",
        values: ["Construção", "Reforma de telhados", "Reforma de pisos", "Reforma de portas e janelas"]
      },
      {
        order: 2,
        title: "Informações adicionais",
        type: "textarea"
      }            
    ]
  end  
end
