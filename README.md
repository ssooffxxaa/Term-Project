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
|<img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdh01_J9HV_-d8SeddxOHFa0ShceE9NhQ4DJKWo-y2MGCTJEl4TsokWUS3v3D6cZvYJlQdVTATwR16BntF9ZOy1TRZ-OC47qspYyGf0x5-zGiEKQwSIGqWml33W018c_jCmcTinZvKuSul_cejh8VgsUW8K?key=qf18D7T0Xyq5nrzLv457eg" alt="Local JSON File" width="80"/>|**Local JSON File** เป็นไฟล์ข้อมูลที่เก็บในคอมพิวเตอร์ ใช้เป็นฐานข้อมูลหลักในรูปแบบ JSON โดยทำหน้าที่ให้บริการข้อมูล JSON ที่มีบนเครื่อง local แก่ JSON_Server|
|<img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdCsxt9so2GUetCDTgiST08iLGOZZk4qu-ak58rRdYJffo6CZu7yvoibwQC3PI7k0ly8VW9McKZaYUVkkHWarBD_l3a98Z-Zw_wYiZfBBdp8PZC7Ef-YVlR3wTAkl5Q3iOVGH5XyXJuMz6Yv3beR3IWpueC?key=qf18D7T0Xyq5nrzLv457eg" alt="JSON Server" width="80"/>|**JSON_Server** เซิร์ฟเวอร์จําลองที่รันบนคอมพิวเตอร์ ทำหน้าที่ให้บริการข้อมูลจากไฟล์ JSON โดยตรงแก่แอปพลิเคชันที่เชื่อมต่อเข้ามา เมื่อแอปพลิเคชันร้องขอข้อมูล JSON_Server จะตอบสนองด้วยการส่งข้อมูลในรูปแบบ JSON เพื่อให้แอปพลิเคชันสามารถประมวลผลต่อไป|
|<img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdAhxlv1LASuTB5-qjZRZ8DZNiBzi3tD4tc8xja4GGRXfZlOLlG590ZB8RY_bM-T85MCU-iLLrersDOgU-ia1u_E3UjgpkMw4dFekx2P5FzoTXWN9thJrrSw5J9ggTeFlADJj6pfM2NBevEprJKeh_KmKW7?key=qf18D7T0Xyq5nrzLv457eg" alt="Local Data Access" width="80"/>|**Local Data Access** แอปพลิเคชันที่รันบน Android Emulator จะเชื่อมต่อกับ JSON_Server เพื่อดึงข้อมูลและจัดการข้อมูลที่เก็บไว้ใน Local JSON File โดยตรง Local Data Access ใช้ในการส่งคําขอไปยัง JSON_Server และรับข้อมูล JSON ที่ตอบกลับมาเพื่อนําไปแสดงผลหรือใช้ในการประมวลผลภายในแอปพลิเคชัน|

- **Software Architecture (5 คะแนน, -0.25)**
	4. **UI Components:**
**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd6Vv8nYNned_9WS0f_2ePcz-jwWMpjPOwD3TEe80MZLq9ZBFcWGfyyeEqc1UnuE7C6s4CkeAf8qUK3AAI497YOvXoc7rv3AIM7NgnnqsT7vBTDc_3vjYsb6LET54ofZg_nIFcPulz2D2whDqtFmEBrFnuY?key=qf18D7T0Xyq5nrzLv457eg)
**

	**ปุ่มบน UI**
บน UI แอปพลิเคชันมีปุ่มการใช้งานทั้งหมดดังนี้

||||||
|--|--|--|--|--|
|ปุ่มการเพิ่มโพสต์ข้อความ **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfMcrmAHUHZsZDwFHl0hdVFSFM-s9uu3ut7AlAdQQ3AmHK6IhTxRlfxttQZsseEuK_wA1_Dxasl9bsr0LS6WIPItrjyUcUPzTh8cJXOMp005rY5ZcynongRtjz7VvSdjaR_WrK2F1Mk7SSuh-R8x5opU6O6?key=qf18D7T0Xyq5nrzLv457eg)**|ปุ่มหน้าจอ Home **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe1zR_ASu9ZJOYviQJen0N7x2DnCXSZ24hP5VRqIAs3NEvB-yLsDFoad09-VG2ppiI9kkdeQaDhKuuw36eLsMit-kJSFS8k4waFnWkUigs8FyxHm7Y8gU_iqWMfCg8XEWDxbxAdBun3US4j2tHJLVUKJgK3?key=qf18D7T0Xyq5nrzLv457eg)**|ปุ่มประวัติการใช้งาน **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfx_gI-sOf9kXIkef6kMqquSBJ6tdDc0OId75vhUnTXMr2mRm5wmQLU4V4CVLpQN3YW-h8_ohmne8rSj9s0tMIHyvk46PqJNcW1V5C2rfBnVdiX5Y13lOyEtqW1N_4pGUU3EUdP3_xnZyR6GiZWah5-yNc?key=qf18D7T0Xyq5nrzLv457eg)**|ปุ่มโพสต์ข้อความ **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXct94cE_uSRTvDZOOSOAb1wmxJPytaqfDvHWM5jMSAA7KO9tj8kKbp5s28ZSFN0Z9PDyHflzOiDGQYUoiqGr2taCvxyzJH9UZQJRPAKabMg0CYol58K4UBQdLnzpgFNzxKi64saZMO-5zAh0-dLGOlSGEWa?key=qf18D7T0Xyq5nrzLv457eg)**|ปุ่มลบข้อมูล **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfviidcUykj-6bXqvneEiJk1sBlNYL7PBuVI292ehkaP8_nTN_7VtAfjKRUkYigMUINJRawfuu9lqtDpeHolOuB2kXo9gYCHwZvTWZTg4JRscn7fPnL_h04CQ_VbxMnGFd5mklFE3aE2DXHPZEVuhVIGuvE?key=qf18D7T0Xyq5nrzLv457eg)**|
|ปุ่มถูกใจ **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXftz21mg-4S52hZN7JF_DAu3okkYyluVINC-c12KlJs-2_gz37YgDkHkcYwTTpACUKZ6Q8U3f2Kbn968OGfVmIBAO8ebzaUJ9UTNhrR1XZCLfW9BeVFQ_Hl9I4G-XpdUXc37JEv2ttpFjlzKHTFGRP2_cwt?key=qf18D7T0Xyq5nrzLv457eg)**|ปุ่มไม่ถูกใจ **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXceZh-VVKEDE2cFzwzn2soWix61cxvOP8o25itGJvamUZoXF8VzXlAw4N8yrW4-y5WULgWkNVuFUmhzv8UFbEPMkyXZKVzPUc2PvAJeH8P2b13Li-wCwEOaChW3IECBmoLWpuh4WVHUsENjgCqSoET-6YaA?key=qf18D7T0Xyq5nrzLv457eg)**|ปุ่มแสดงความคิดเห็น **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXetw2LkRF3k_sGbA8QbGpZjDWkZGnCeF9tw1nAMOBFy0HP75J08DwwIbW5uQ_5IUcqKM-8B3929VzpP66YnhtwEoD-p9OudpYYmC1ERwuJXlFC8XwgCTNanDKNrrTUZma5hIlWzCHaC_VucHzjTGs3EZeWx?key=qf18D7T0Xyq5nrzLv457eg)**|ปุ่มยกเลิก **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdUOhmFP50kinpVb0IDTUMmhAkzPesCvqocBOmrTEd1ZaHOn35KRXj6i6kZQp8BW2ttOHA50PM8iuFsFZpFDSKRIpzKHKRhyglAk0DZuHDVQd87JP6T4f61tnLVW1x2FNfa5Lsh_v5z2v9eecSkfVjoiYbb?key=qf18D7T0Xyq5nrzLv457eg)**|ปุ่มแก้ไขข้อมูล **![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdbowu_6QGKKMIrkA36pPtg6jWS5HJbcrJ_Oe3WWsLfabbLlHD20A5PHU2aarjyM8l1unhrmE9Y_UXCRmJRKhQvuyXTvtWo5mqteGRyTNRt0a80Znv7prkFnUYUwU43wy8jNtfoMbzK6xH8uclduXISRZ0z?key=qf18D7T0Xyq5nrzLv457eg)**|

**การใช้งานซ้ำ**  
		จากภาพที่ 5 มีการใช้ซ้ำใน Frame ที่ 1 และ Frame ที่ 3 ดังนี้
-   มีการใช้ Menu Bar (แถบเมนูด้านล่าง) ซ้ำ
-  	มีการใช้ List ช่องใส่ข้อมูลแสดงความรู้สึกของผู้ใช้ซ้ำ
-   มีการใช้ปุ่มการเพิ่มโพสต์ข้อความซ้ำ

และมีการใช้ซ้ำใน Frame ที่ 2 และ Frame ที่ 4 ดังนี้
-   หน้า UI ของทั้งสองเฟรมมีการใช้ซ้ำเหมือนกันต่างกันตรงที่ Frame ที่ 4 เป็นหน้าการแก้ไขโพสต์ทำให้มีข้อมูลที่เคยโพสต์แสดงอยู่เพื่อรอผู้ใช้แก้ไข

5. **Data Management**
**ตารางที่ 1** โครงสร้างของตารางโพสต์
