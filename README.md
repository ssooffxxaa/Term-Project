<h1 align="center">MindSpace</h1>


## 1. Teams
-   นางสาว โซเฟีย ปัญญาผล รหัสนักศึกษา 65102360
-   นางสาว พลัม เกกีงาม รหัสนักศึกษา 65105827
-   นางสาว มุทิตา คีรีรักษ์ รหัสนักศึกษา 65106973

## 2. Introduction (5 คะแนน, -0.25)

- Problem Statment
ในชีวิตประจำวัน ผู้คนมักเผชิญกับความเหงาและความเครียดที่สะสมจากการดำเนินชีวิต ความรู้สึกเหล่านี้ทำให้พวกเขาต้องการที่ปรึกษาหรือเพียงแค่ใครสักคนที่จะรับฟัง แต่ไม่ใช่ทุกคนที่จะมีใครคอยอยู่เคียงข้างเพื่อให้คำแนะนำหรือช่วยเหลือได้ การสะสมความเครียดเหล่านี้โดยไม่มีช่องทางระบาย อาจส่งผลกระทบต่อสุขภาพจิตและการใช้ชีวิตประจำวันของพวกเขา
เราจึงมุ่งพัฒนาแอปพลิเคชันที่เปิดพื้นที่สำหรับผู้ที่ต้องการระบายความรู้สึก หรือต้องการคำปรึกษาจากผู้อื่น โดยไม่จำเป็นต้องเปิดเผยตัวตน แอปนี้จะช่วยลดความกังวลเกี่ยวกับความเป็นส่วนตัว และป้องกันความกลัวต่อการถูกตัดสินหรือรุกล้ำจากผู้อื่น เพื่อให้ผู้ใช้สามารถแบ่งปันความรู้สึกได้อย่างสบายใจ

- Objectives
	1. สร้างแพลตฟอร์มที่ผู้ใช้สามารถโพสต์ข้อความ แชร์ความรู้สึก หรือขอคำปรึกษาได้แบบไร้ตัวตน
	2. ให้ผู้ใช้เชื่อมต่อและพบปะเพื่อนใหม่ได้อย่างอิสระในโลกออนไลน์ที่ไม่มีขีดจำกัด
	3. สร้างสังคมออนไลน์ที่มีความปลอดภัยและมีความเป็นส่วนตัวสำหรับวัยเรียนและวัยทำงาน

## 3. Design

- **System Architecture (5 คะแนน, -0.25)**
	1. **Presentation Layer (Frontend)**
ส่วนนี้เป็นหน้าต่างการใช้งาน (User Interface) และประสบการณ์ผู้ใช้ (User Experience) ซึ่งรวมถึงการออกแบบหน้าจอ, การโต้ตอบระหว่างผู้ใช้กับแอปพลิเคชัน, การแสดงผลข้อมูล และการจัดการการนำทาง (Navigation) ภายในแอปพลิเคชัน
**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc98btWjA6_OXNL7HBL3Jk8v-eaXBpIDLeV_21fi1P3lSzLJrwspkgscRZlY5FXPLqUaNzx7T_KXdBkYfzsqQBo16DtlKM5swYf6wKfejwZO2HJkw4UAReiXvs0wb5rr63nEun94DJoxQIi4rgxiocsT7C0?key=qf18D7T0Xyq5nrzLv457eg)**
จากภาพที่ 1 เมื่อผู้ใช้กดปุ่มเพิ่มโพสต์ ระบบจะอนุญาตให้ผู้ใช้กรอกข้อมูลโพสต์ตามที่ต้องการได้ หลังจากที่กรอกข้อมูลเสร็จและกดปุ่ม "Post" ข้อมูลที่ผู้ใช้ป้อนจะถูกส่งไปยัง JSON_Server และจะแสดงผลโพสต์ใหม่บนหน้าหลักทันที
**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXflgxHoxE8M4ULHRyAlbi-PgmtZVRgHzR377B1AYk7li__2xzpJjk5QCe1-Dm0uAwx62yRWyY429XPCmiTdSPgefHVNVxNsMNiPBsJW2865WiZdB0EibziK3HtJLDmjrKN_Y16f_QAKtTFCWuFHrxxUdUuO?key=qf18D7T0Xyq5nrzLv457eg)**
จากภาพที่ 2 เมื่อผู้ใช้กดปุ่มแก้ไขโพสต์ ระบบจะอนุญาตให้ผู้ใช้สามารถแก้ไขข้อมูลในโพสต์นั้นได้ตามต้องการ หลังจากที่ผู้ใช้ทำการแก้ไขเสร็จเรียบร้อยและกดปุ่ม "Post" ข้อมูลที่ถูกแก้ไขจะถูกส่งไปยัง JSON_Server เพื่ออัปเดตข้อมูลโพสต์ให้เป็นปัจจุบันและจะแสดงผลในหน้าหลักทันที

	2. **Business Logic Layer (Application Layer)**
Application นี้เป็นแอปสำหรับการโพสต์ข้อความหรือเหตุการณ์ต่างๆ แบบไม่ระบุตัวตน และสามารถแสดงความคิดเห็น รวมถึงการดูประวัติการโพสต์และการแจ้งเตือนการตอบกลับต่างๆ นั้น Business Logic Layer มีบทบาทสำคัญในการจัดการกับการประมวลผลและฟังก์ชันต่าง ๆ ของแอป โดยสามารถอธิบายรายละเอียดได้ดังนี้
**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeijScXopDLCau8gFZ5uqw9PE9whD1lIqPZQ1hlfKPnXjH9s3dtx1Rg1s1rfBvZmwNSDCrCbmP9AP1SAbpqEkW0w6_ijDdapiCbaoexcCF9jsNduRvUEgPtMDx3VPuD-Umv5b-j_xSL4sOlqT7cKlvOuGJ-?key=qf18D7T0Xyq5nrzLv457eg)**
	- **การควบคุมการทำงานของแอป (Application Control)**
Business Logic Layer จะควบคุมการทำงานของแอปตามการโต้ตอบของผู้ใช้ ตัวอย่างเช่น เมื่อผู้ใช้กดปุ่มโพสต์ข้อความหรือกดตอบกลับโพสต์ แอปจะทำงานตามที่ผู้ใช้คาดหวัง ซึ่งในที่นี้ Business Logic Layer จะเป็นตัวกลางที่รับคำสั่งจากผู้ใช้และทำการประมวลผลตามเงื่อนไขที่กำหนดไว้
	- **การเชื่อมต่อกับชั้นข้อมูล (Data Layer)**
Business Logic Layer จะเชื่อมต่อกับ Data Layer เพื่อส่งคำขอไปยัง JSON_Server เพื่อดึงข้อมูลที่จำเป็นสำหรับการประมวลผลและการแสดงผลบน Presentation Layer ในแอป เช่น การดึงข้อมูลโพสต์ที่มีอยู่ หรือการดึงข้อมูลความคิดเห็นที่เกี่ยวข้องกับโพสต์

โดยรวมแล้ว Business Logic Layer ทำหน้าที่เป็นหัวใจของแอปพลิเคชันที่คอยควบคุมและประมวลผลทุกอย่างที่เกิดขึ้นภายในแอป ทั้งการจัดการข้อมูล การควบคุมการทำงาน และการเชื่อมต่อกับ Data Layer เพื่อทำให้แอปทำงานได้อย่างสมบูรณ์และมีประสิทธิภาพ

3. **Data Layer**
		Data Layer ในระบบนี้เป็นการจัดการข้อมูลทั้งหมดที่ Application ต้องการ โดยจะทำงานในระดับ local ซึ่งหมายถึงการทำงานทั้งหมดจะเกิดขึ้นบนเครื่องคอมพิวเตอร์โดยไม่ต้องมีการเชื่อมต่อผ่าน URL หรือ HTTP/HTTPS ภายนอก การทำงานของ Data Layer นี้เน้นที่การจัดการข้อมูลที่เก็บอยู่ในเครื่องและการให้บริการข้อมูลผ่าน JSON_Server
**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe8xQRFv24B_Zv9SncfDUDbpDLi52LRWP5TZfVgBGZnebYDXiXc0oJKQku_A2Pf-ctF5M9f9GbRJbOFkA83r6HxarNVZgdlq0O8uWgpc_a3hRbUYMZVREB-lzg9lCEDOzfroYHosaGc10zAQQmQUoWZbdIG?key=qf18D7T0Xyq5nrzLv457eg)**











|องค์ประกอบ|หน้าที่|
|----------------|-------------------------------|
|**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdh01_J9HV_-d8SeddxOHFa0ShceE9NhQ4DJKWo-y2MGCTJEl4TsokWUS3v3D6cZvYJlQdVTATwR16BntF9ZOy1TRZ-OC47qspYyGf0x5-zGiEKQwSIGqWml33W018c_jCmcTinZvKuSul_cejh8VgsUW8K?key=qf18D7T0Xyq5nrzLv457eg)**|**Local JSON File** เป็นไฟล์ข้อมูลที่เก็บในคอมพิวเตอร์ ใช้เป็นฐานข้อมูลหลักในรูปแบบ JSON โดยทำหน้าที่ให้บริการข้อมูล JSON ที่มีบนเครื่อง local แก่ JSON_Server|
|**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdCsxt9so2GUetCDTgiST08iLGOZZk4qu-ak58rRdYJffo6CZu7yvoibwQC3PI7k0ly8VW9McKZaYUVkkHWarBD_l3a98Z-Zw_wYiZfBBdp8PZC7Ef-YVlR3wTAkl5Q3iOVGH5XyXJuMz6Yv3beR3IWpueC?key=qf18D7T0Xyq5nrzLv457eg)**|**JSON_Server** เซิร์ฟเวอร์จําลองที่รันบนคอมพิวเตอร์ ทำหน้าที่ให้บริการข้อมูลจากไฟล์ JSON โดยตรงแก่แอปพลิเคชันที่เชื่อมต่อเข้ามา เมื่อแอปพลิเคชันร้องขอข้อมูล JSON_Server จะตอบสนองด้วยการส่งข้อมูลในรูปแบบ JSON เพื่อให้แอปพลิเคชันสามารถประมวลผลต่อไป
|**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdAhxlv1LASuTB5-qjZRZ8DZNiBzi3tD4tc8xja4GGRXfZlOLlG590ZB8RY_bM-T85MCU-iLLrersDOgU-ia1u_E3UjgpkMw4dFekx2P5FzoTXWN9thJrrSw5J9ggTeFlADJj6pfM2NBevEprJKeh_KmKW7?key=qf18D7T0Xyq5nrzLv457eg)**|**Local Data Access** แอปพลิเคชันที่รันบน Android Emulator จะเชื่อมต่อกับ JSON_Server เพื่อดึงข้อมูลและจัดการข้อมูลที่เก็บไว้ใน Local JSON File โดยตรง Local Data Access ใช้ในการส่งคําขอไปยัง JSON_Server และรับข้อมูล JSON ที่ตอบกลับมาเพื่อนําไปแสดงผลหรือใช้ในการประมวลผลภายในแอปพลิเคชัน
