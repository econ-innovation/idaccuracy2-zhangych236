#作业二

#从Aminer的数据表格中筛选出同一个作者ID（uniqueID）下面同样被包含在scientist_pub.csv中的论文数据；
#提示：使用论文doi号、期刊、title、发表年份等信息；stringr包中str_to_upper函数可以将字符转化成大
#写字符；使用str_extract(filename,"0_[0-9+]")可以从文件名中提炼出uniqueID，uniqueID是连接两张表的变量。

# 导入所需包
library(readxl)
library(dplyr)
library(stringr)

filepath = "D:/bigdata/data/assignment_idaccuracy/Aminer/"
workpath = "D:/R_Project/bigdata/homework/homework2/"

getwd()
setwd(filepath)
file_list <- list.files(pattern = ".csv")
merged_data <- data.frame()
# for循环读取文件并合并
for (w in dir(filepath)){
  file <- read.csv(paste(filepath,w,sep=''), header = TRUE)
  merged_data <- rbind(merged_data,file)
}

uniqueID <- str_extract(file_list,"0_[0-9]+")#将文件名

upperAm <- sapply(combined_data, str_to_upper)#将内容转化为大写

print(uniqueID)



# 设置工作目录，替换为你的文件夹路径
setwd <- mypath

# 获取文件列表
files <- file_list 

# 创建一个数据框用于保存文件名和数字部分
data <- data.frame(FileName = files, NumericPart = NA)

# 提取文件名中的数字部分
data$NumericPart <- str_extract(file_list,"0_[0-9+]")

# 读取Excel文件并添加新变量
for (file in files) {
  # 读取Excel文件
  df <- read_csv(file)
  
  # 获取文件名的数字部分
  numeric_part <- uniqueID
  
  # 在数据框中添加新变量并赋值
  df <- mutate(df, NewVariable = uniqueID)
  
  # 将修改后的数据写入新的Excel文件
  write_csv(df, path = paste0("output_", numeric_part, ".csv"))
}



#计算每一个作者ID的精准度和查全率；

#提示：精准度定义为预测数据集（aminer）中预测准确的数据（即同样包含在scientist_pub表中）所占比重；查
#全率的定义为标准数据集（scientist_pub）中被预测准确的数据（即同样包含在aminer表中）所占比重


#计算aminer数据库的平均精准度和查全率