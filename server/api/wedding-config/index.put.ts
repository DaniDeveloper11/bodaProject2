import { prisma } from '~/server/prisma'

export default defineEventHandler(async (event) => {
  const body = await readBody(event)

  if (!body || typeof body !== 'object') {
    throw createError({ statusCode: 400, message: 'Datos de configuración inválidos' })
  }

  const result = await prisma.weddingConfig.upsert({
    where: { slug: 'default' },
    update: { data: body },
    create: { slug: 'default', data: body },
  })

  return { message: 'Configuración guardada con éxito', id: result.id }
})
