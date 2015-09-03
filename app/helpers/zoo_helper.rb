module ZooHelper

  def zoo_name(zoo)
    name = zoo.name
    if name.downcase.include?('zoo')
      name
    else
      "#{name} Zoo"
    end
  end
end

