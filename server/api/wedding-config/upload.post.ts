import { readMultipartFormData } from 'h3'
import { writeFile, mkdir } from 'fs/promises'
import { join } from 'path'

export default defineEventHandler(async (event) => {
  const formData = await readMultipartFormData(event)

  if (!formData || formData.length === 0) {
    throw createError({ statusCode: 400, message: 'No se recibieron archivos' })
  }

  const slug = 'default'
  const uploadDir = join(process.cwd(), 'public', 'uploads', slug)
  await mkdir(uploadDir, { recursive: true })

  const uploaded: { fieldKey: string; path: string; filename: string }[] = []

  for (const file of formData) {
    if (!file.filename || !file.data) continue

    const allowedTypes = ['image/webp', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml']
    if (file.type && !allowedTypes.includes(file.type)) {
      throw createError({ statusCode: 400, message: `Tipo de archivo no permitido: ${file.type}` })
    }

    const maxSize = 5 * 1024 * 1024 // 5MB
    if (file.data.length > maxSize) {
      throw createError({ statusCode: 400, message: `Archivo demasiado grande: ${file.filename}` })
    }

    const sanitizedName = file.filename.replace(/[^a-zA-Z0-9._-]/g, '_')
    const timestamp = Date.now()
    const finalName = `${timestamp}-${sanitizedName}`
    const filePath = join(uploadDir, finalName)

    await writeFile(filePath, file.data)

    const publicPath = `/uploads/${slug}/${finalName}`
    const fieldKey = file.name || ''

    uploaded.push({ fieldKey, path: publicPath, filename: finalName })
  }

  return { uploaded }
})
