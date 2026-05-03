import { prisma } from '~/server/prisma'
import staticConfig from '~/wedding.config'

export default defineEventHandler(async () => {
  const record = await prisma.weddingConfig.findUnique({
    where: { slug: 'default' },
  })

  return record?.data ?? staticConfig
})
