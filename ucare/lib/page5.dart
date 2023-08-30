import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {

  List<String> imageUrl = ["https://th.bing.com/th/id/OIP.rSrx3v6uQT3_WRR_eDAhHAAAAA?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/OIP.UkvSIPM7cmxJ3ySzPKg0bgHaHa?pid=ImgDet&w=500&h=500&rs=1",
    "https://www.badsydney.com/wp-content/uploads/2020/07/MartijnBoersma_authorpic.jpg",
    "https://d2pnpqlbobcs6g.cloudfront.net/users/avatars/000/001/060/original/0?1547472226",
    "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1416563390/k3evyoe2um31xeffjldg.jpg",
    "https://media.licdn.com/dms/image/C4E03AQFuqJApeVOZ0g/profile-displayphoto-shrink_800_800/0/1517068955339?e=2147483647&v=beta&t=6ji0qhtjdfVKb0chow1A2pbhohdk4VY3iw24-lfxv3Y",
    "https://i0.wp.com/www.hadviser.com/wp-content/uploads/2019/04/24-shaggy-bob-for-square-face-BcKy3nOnaAm.jpg?fit=995%2C995&ssl=1"
  ];

  List<String> doctorName = ["Jana", "Avery", "Miles" ,"Lila", "Evelyn","Charan","Bhavya"];

  List<int> doctorId = [1234,5678,9012,3456,7890,6241,9102];

  List<String> date = ["10/08/2023","23/01/2023","06/04/2025","29/02/2027","01/12/2026","23/01/2023","06/04/2025"];

  List<String> health_status = ["Infected", "Dehydrated", "Healthy" ,"Infected", "Healthy","Dehydrated","Infected"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              leading: Image.network(imageUrl[index]),
              title: Text("Name: ${doctorName[index]}"),
              subtitle: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("ID: ${doctorId[index]}  Date: ${date[index]}"),
                  Text("Status: ${health_status[index]}")
                ],
              ),
            ),
          );
        }
    );

  }
}
