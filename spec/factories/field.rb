FactoryGirl.define do
  factory :field do
    order 1
    title "First Field"
    type "checkbox"
    values ["Foo", "Bar", "Baz"] 
  end
end
