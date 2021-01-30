import express, { Application } from 'express';
import {  ApolloServer , Config } from 'apollo-server-express';
import {schema} from './schema/schema';
import {promisePool} from './models/db';

const app: Application  = express();

const config : Config = {
    typeDefs:schema,
    resolvers : {
        Query:{
            get_city: async (parent,args,ctx) => {
                const [rows] = await promisePool.query("SELECT * FROM `gr_city` WHERE `id` = ?", [args.id]);

                const [stations] = await promisePool.query("SELECT * FROM `gr_station` WHERE `city_id` = ?", [rows[0].id]);

                let data = rows[0];

                data.stations = stations;

                return data
            },
            set_city: async (parent, args) => {
                const [result] = await promisePool.query("INSERT INTO `gr_city` SET `name` = ?, `phone` = ?", [args.name, args.phone]);
                let id = 0;
                if ("insertId" in result) {
                    id = result.insertId;
                }
                return {
                    name: 'New city Added is ID: ' + id,
                }
            },
            get_station: async (parent,args,ctx)=>{
                const [rows] = await promisePool.query("SELECT * FROM `gr_station` WHERE `id` = ?", [args.id]);
                return rows[0]
            },
            set_station:async (parent,args,ctx)=>{
                const [result] = await promisePool.query("INSERT INTO `gr_station` SET `name` = ?, `city_id` = ?", [args.name, args.city_id]);
                let id = 0;
                if ("insertId" in result) {
                    id = result.insertId;
                }
                return {
                    name: "New station Added is ID: " + id
                }
            },
        }
    },
    introspection: true,
    playground: true,

}

const server : ApolloServer = new ApolloServer(config);

server.applyMiddleware({
    app,
    path: '/graphql'
});

app.listen(3000,()=>{
    console.log("We are running on http://localhost:3000/graphql")
})