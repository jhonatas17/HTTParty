   

After do |scenario|
    if scenario.failed?
      puts "REQUEST=> #{@request.to_json}"
      puts "REQUEST=> #{@result.parsed_reponse.to_json}"
    end 
end        