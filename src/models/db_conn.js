const sql = require("mssql");
const config = {
    server: 'localhost',
    database: 'GELADEIRA',
    port: 1433,
    user: 'desespero',
    password: 'desespero123',
    trustServerCertificate: true,
    options: {
        cryptoCredentialsDetails: {
            minVersion: 'TLSv1',
            trustServerCertificate: true,
        }
    }
};

async function executeProcedure(procedureName, parameters = {}) {
    try {
        let pool = await sql.connect(config);
        let request = pool.request();

        Object.keys(parameters).forEach((key) => {
            request = request.input(key, parameters[key]);
        });

        return await request.execute(procedureName);
    } catch (err) {
        console.error('Database operation failed:', err);
        throw err;
    }
}

async function executeQuery(query) {
    try {
        let pool = await sql.connect(config);
        console.log(query)
        return await pool.request().query(query);
    } catch (err) {
        console.error('Database operation failed:', err);
        throw err;
    }
}

module.exports = { executeProcedure, executeQuery };