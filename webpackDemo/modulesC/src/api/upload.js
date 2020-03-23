import request from '@/utils/request'
export function upload (data) {
  return request({
    url: '/file/fileupload',
    method: 'post',
    data
  })
}
export function insertUpload (data) {
  return request({
    url: '/upload/insertUpload',
    method: 'post',
    data
  })
}

export function selectAlllist (data) {
  return request({
    url: '/upload/selectAlllist',
    method: 'post',
    data
  })
}
