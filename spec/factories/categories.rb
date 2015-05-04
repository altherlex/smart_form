FactoryGirl.define do
  factory :category do
    name "MyString"
    slug "MyString"
  end
  factory :reformas_e_reparos, class:Category do
    name "Reformas e reparos"
    slug "reformas-e-reparos"
  end  
end
