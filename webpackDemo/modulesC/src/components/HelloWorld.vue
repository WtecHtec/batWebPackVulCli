<template>
<div>
  <el-button type="primary" @click="goodslist">确定</el-button>
  <el-upload :action="uploadaction" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-success="uploadSuccess">
  <i class="el-icon-plus"></i>
  </el-upload>
  <el-dialog :visible.sync="dialogVisible">
  <img width="100%" :src="dialogImageUrl" alt="">
  </el-dialog>
  <el-button @click="feachdata">刷新</el-button>
   <!--显示-->
  <el-table border :data="uploadlist" v-loading="loading" element-loading-text="拼命加载中" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.8)">
    <el-table-column prop="id" label="编号"></el-table-column>
    <el-table-column prop="imageurl" label="图片">
      <template slot-scope="scope">
      <img :src="scope.row.imageurl" width="50px" height="50px">
      </template>
    </el-table-column>
    <el-table-column prop="createTime" label="创建时间"></el-table-column>
  </el-table>
 </div>
</template>
<script>
import { goodlists } from '@/api/goods'
import { selectAlllist } from '@/api/upload'
export default {
  data () {
    return {
      dialogVisible: false,
      dialogImageUrl: '',
      uploadaction: 'http://localhost:8200/file/fileupload',
      loading: true,
      uploadlist: [],
      uploaddata: {
        id: '',
        createTime: '',
        imageurl: ''
      }
    }
  },
  created () {
    this.feachdata()
  },
  methods: {
    goodslist (data) {
      console.log('点击')
      goodlists().then(response => {
        console.log(response.data.responseData)
      })
    },
    handleRemove (file, fileList) {
      alert(file.url)
      console.log(file, fileList)
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = file.url
      alert(file.url)
      this.dialogVisible = true
    },
    uploadSuccess (response, file, fileList) {
      this.$message({
        message: '上传成功',
        type: 'success'
      })
    },
    feachdata () {
      selectAlllist().then(response => {
        if (response.data.statusCode === 200) {
          this.uploadlist = response.data.responseData
          this.loading = false
        }
        this.loading = false
      })
    }
  }
}
</script>
