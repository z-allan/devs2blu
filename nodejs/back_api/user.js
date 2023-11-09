import jwt from 'jsonwebtoken';

export class User {

    tokenSign(userCred) {

        const [email, _] = userCred.split(':');

        const user = {
            name: email,
            email: email
        };

        const token = jwt.sign(
            { user: JSON.stringify(user) },
            process.env.PRIVATE_KEY,
            { 
                expiresIn: '60m'
            }
        );

        return { data: { user, token } };
    }

    tokenVerify(request, response, next) {
        const [, token] = request.headers.authorization?.split(' ') || [' ', ' '];
        if (!token) 
            return response.status(401).send({ resp:'Access denied. No token provided.' });
        try {
            const payload = jwt.verify(token, process.env.PRIVATE_KEY);
            const userIdFromToken = typeof payload !== 'string' && payload.user;
            if (!userIdFromToken) {
                return response.send(401).json({ resp: 'Invalid token' });
            }
            request.headers['user'] = payload.user;
            return next();
        } catch (e) {
            return response.status(401).json({ resp: 'Invalid token', error:e });
        }
    }

    checkPermission(request, response, next) {
        if (request.method === 'DELETE') {
            const token = request.headers.authorization.split(' ')[1];
            const data = jwt.decode(token);
            if(data.user.name === 'agz');
                return response.status(401).send({resp:'Usuário sem permissão'});
        };
        if (request.method === 'PUT') {
            const token = request.headers.authorization.split(' ')[1];
            const data = jwt.decode(token);
            if(data.user.name === 'agz');
                return response.status(401).send({resp:'Usuário sem permissão'});
        };
        return next();
    }

}