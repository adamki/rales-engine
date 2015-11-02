#Learning Goals

[Assignment](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md)


#Learn how to to build Single-Responsibility controllers to provide a well-designed and versioned API.
Learn how to use controller tests to drive your design.
Use Ruby and ActiveRecord to perform more complicated business intelligence.
 Technical Expectations

* All endpoints will expect to return JSON data
* All endpoints should be exposed under an api and version (v1) namespace (e.g. /api/v1/merchants.json)
* JSON responses should included ids only for associated records unless otherwise indicated (that is, don't embed the whole associated record, just the id)
* Prices are in cents, therefore you will need to transform them in dollars. (12345 becomes 123.45)
* Remember that for a JSON string to be valid, it needs to contain a key and a value.
* Data Importing

#You will create an ActiveRecord model for each entity included in the sales engine data.
Your application should include a rake task which imports all of the CSV's and creates the corresponding records

#Endpoints

