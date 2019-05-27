def find(key, name, data)
  data[key].select { |_, v| v.include? name }
end

def form(name, data, gender)
  {
      color: find(:color, name, data).keys.map { |k| k.to_s },
      gender: [gender.to_s],
      lives: [find(:lives, name, data).keys.first]
  }
end

def nyc_pigeon_organizer(data)
  Hash[ *data[:gender].map { |gender, arr| arr.collect { |pigeon| [pigeon, form(pigeon, data, gender)] } }.flatten ]
end
