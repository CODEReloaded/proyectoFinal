json.array!(@solicituds) do |solicitud|
  json.extract! solicitud, :id, :nombre, :ocupacion, :edad, :por_que, :consideras, :experiencia, :actividades, :gastos, :vivienda, :dormir, :mudarse, :ajuste
  json.url solicitud_url(solicitud, format: :json)
end
