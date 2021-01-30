export const schema = `
    type City{
        id: ID!,
        name: String,
        phone: Int,
        stations: [Station]
    }
    
    type Station{
        id: ID,
        name: String,
        city_id: Int
    }
    
    type Query {
        get_city(id: ID!): City,
        set_city(name: String!,phone: Int!): City
        get_station(id: ID!): Station
        set_station(name: String!,city_id: Int!): Station
    }
`
