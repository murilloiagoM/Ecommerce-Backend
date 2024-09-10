export let adminuser = ""

export function isAuth(request, reply, done){
  const { authorization } = request.headers

  if(authorization != "Bearer token"){
    reply.status(403).send({message: "Nao autorizado"})
  }
  done()
}

export function setAdmin(token){
  adminuser = token
}

export function isAdmin(request, reply, done){
  const { auth } = request.cookies;
  if (auth != adminuser) {
    return reply.status(403).send({ error: 'Nao autorizado!!' });
  }
  done()
}