import request from '@/utils/request'
export function goodlists (data) {
  return request({
    url: '/uer/uerall',
    method: 'post',
    data
  })
}
