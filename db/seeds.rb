ANIMAL_NAMES = ['JAMES','JOHN','ROBERT','MICHAEL','MARY','WILLIAM','DAVID','RICHARD','CHARLES','JOSEPH','THOMAS','PATRICIA','CHRISTOPHER','LINDA','BARBARA','DANIEL','PAUL','MARK','ELIZABETH','DONALD','JENNIFER','GEORGE','MARIA','KENNETH','SUSAN','STEVEN','EDWARD','MARGARET','BRIAN','RONALD','DOROTHY','ANTHONY','LISA','KEVIN','NANCY','KAREN','BETTY','HELEN','JASON','MATTHEW','GARY','TIMOTHY','SANDRA','JOSE','LARRY','JEFFREY','FRANK','DONNA','CAROL','RUTH','SCOTT','ERIC','STEPHEN','ANDREW','SHARON','MICHELLE','LAURA','SARAH','KIMBERLY','DEBORAH','JESSICA','RAYMOND','SHIRLEY','CYNTHIA','ANGELA','MELISSA','BRENDA','AMY','JERRY','GREGORY','ANNA','JOSHUA','VIRGINIA','REBECCA','KATHLEEN','DENNIS','PAMELA','MARTHA','DEBRA','AMANDA','WALTER','STEPHANIE','WILLIE','PATRICK','TERRY','CAROLYN','PETER','CHRISTINE','MARIE','JANET','FRANCES','CATHERINE','HAROLD','HENRY','DOUGLAS','JOYCE','ANN','DIANE','ALICE','JEAN','JULIE','CARL','KELLY','HEATHER','ARTHUR','TERESA','GLORIA','DORIS','RYAN','JOE','ROGER','EVELYN','JUAN','ASHLEY','JACK','CHERYL','ALBERT','JOAN','MILDRED','KATHERINE','JUSTIN','JONATHAN','GERALD','KEITH','SAMUEL','JUDITH','ROSE','JANICE','LAWRENCE','RALPH','NICOLE','JUDY','NICHOLAS','CHRISTINA','ROY','KATHY','THERESA','BENJAMIN','BEVERLY','DENISE','BRUCE','BRANDON','ADAM','TAMMY','IRENE','FRED','BILLY','HARRY','JANE','WAYNE','LOUIS','LORI','STEVE','TRACY','JEREMY','RACHEL','ANDREA','AARON','MARILYN','ROBIN','RANDY','LESLIE','KATHRYN','EUGENE','BOBBY','HOWARD','CARLOS','SARA','LOUISE','JACQUELINE','ANNE','WANDA','RUSSELL','SHAWN','VICTOR','JULIA','BONNIE','RUBY','CHRIS','TINA','LOIS','PHYLLIS','JAMIE','NORMA','MARTIN','PAULA','JESSE','DIANA','ANNIE','SHANNON','ERNEST','TODD','PHILLIP','LEE','LILLIAN','PEGGY','EMILY','CRYSTAL','KIM','CRAIG','CARMEN','GLADYS','CONNIE','RITA','ALAN','DAWN','FLORENCE','DALE','SEAN','FRANCIS','JOHNNY','CLARENCE','PHILIP','EDNA','TIFFANY','TONY','ROSA','JIMMY','EARL','CINDY','ANTONIO','LUIS','MIKE','DANNY','BRYAN','GRACE','STANLEY','LEONARD','WENDY','NATHAN','MANUEL','CURTIS','VICTORIA','RODNEY','NORMAN','EDITH','SHERRY'].map{|name| name.capitalize}


ZOO_NAMES = ['San Francisco', 'New Orleans', 'Milwaukee', 'Seattle', 'Mississippi State']

ANIMAL_SPECIES = ['monkey', 'pterodactyl', 'octopus', 'bat', 'beaver', 'butterfly', 'firefly', 'fox', 'kangaroo', 'mandrill', 'muskox', 'penguin', 'sandpiper', 'wolverine']


if Rails.env == 'development' || ENV['ALLOW_SEED']
  puts "Warning...About to destroy all zoos and all animals"
  sleep 2
  Zoo.destroy_all

  number_species = ANIMAL_SPECIES.count

  number_names = ANIMAL_NAMES.count

  total_created = 0
  ZOO_NAMES.each do |zoo_name|
    zoo = Zoo.create(name: zoo_name)
    num_animals = rand(50)
    num_animals.times do
      species_index = rand(number_species)
      name_index = rand(number_names)
      zoo.animals.create(species: ANIMAL_SPECIES[species_index], name: ANIMAL_NAMES[name_index])
      total_created += 1
    end
    puts "Created #{num_animals} animals for #{zoo_name}"
  end

  puts "\nCreated #{total_created} animals total"

end
