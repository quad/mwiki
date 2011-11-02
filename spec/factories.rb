FactoryGirl.define do
  factory :page do
    title 'THIS IS A TITLE'
    body <<-EOF
# HEADER

Some text.

** Bolded **
    EOF
  end
end
