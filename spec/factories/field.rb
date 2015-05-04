FactoryGirl.define do
  factory :field do
    order 1
    title "First Field"
    type "checkbox"
    values ["Foo", "Bar", "Baz"] 
  end
  factory :field_text, class:Field do
    order 1
    title "Quantos convidados são esperados?"
    type "text"
  end  
  factory :field_checkbox, class:Field do
    order 2
    title "Qual profissional você precisa?"
    type "checkbox"
    values ["Garçom", "Garçonete", "Copeira"]
  end    
  factory :field_select, class:Field do
    order 3
    title "Qual é o tipo de evento?"
    type "select"
    values ["Bodas", "Formatura", "Aniversário - Adulto", "Aniversário - Infantil", "Debutante", "Casamento", "Evento corporativo", "Outros"]
  end    
  factory :field_textarea, class:Field do
    order 4
    title "Informações Adicionais"
    type "textarea"
  end    
end

