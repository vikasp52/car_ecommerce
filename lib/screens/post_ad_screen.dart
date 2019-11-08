import 'package:car_ecommerce/bloc/car_bloc.dart';
import 'package:car_ecommerce/bloc/post_ad_bloc.dart';
import 'package:car_ecommerce/widgets/textfield/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PostAdScreen extends StatefulWidget {
  @override
  _PostAdScreenState createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  final _postAdBloc = PostAdBloc();

  Future selectSource() {
    return Alert(
      context: context,
      type: AlertType.none,
      title: "SELECT SOURCE",
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              _postAdBloc.uploadImage(camera: false);
              Navigator.of(context).pop();
            },
            child: Card(
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[Icon(Icons.camera), Text('Gallary')],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _postAdBloc.uploadImage(camera: true);
              Navigator.of(context).pop();
            },
            child: Card(
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[Icon(Icons.camera_alt), Text('Camara')],
                ),
              ),
            ),
          )
        ],
      ),
    ).show();
  }

  Widget _buildAddImage() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: StreamBuilder(
        stream: _postAdBloc.imagePathStream,
        builder: (context, snapshot) {
          return StreamBuilder(
              stream: _postAdBloc.imagePathStream,
              builder: (_, snapshotImageFile) {
                return Container(
                  color: Colors.black,
                  height: 200,
                  child: Center(
                    child: InkWell(
                      onTap: () => selectSource(), //_postAdBloc.uploadImage(),
                      child: snapshotImageFile.hasData
                          ? Image.file(
                              snapshotImageFile.data,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                            )
                          : Text(
                              'Add Car Picture\n + \n\n 600 × 350',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _postAdBloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST AD'),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          StreamBuilder<bool>(
              stream: _postAdBloc.loadingStream,
              initialData: false,
              builder: (context, snapshotLoading) {
                if (snapshotLoading.hasData && snapshotLoading.data) {
                  return CircularProgressIndicator();
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      _postAdBloc.loadingSink(true);
                      _postAdBloc.saveCarAdData();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                  ),
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildAddImage(),
            AddTextField(
              label: 'Car Name',
              stream: _postAdBloc.nameStream,
              onChange: _postAdBloc.nameSink,
            ),
            AddTextField(
              label: 'Price',
              stream: _postAdBloc.priceStream,
              onChange: _postAdBloc.priceSink,
              keyboardType: TextInputType.number,
            ),
            AddTextField(
              label: 'Color',
              stream: _postAdBloc.colorStream,
              onChange: _postAdBloc.colorSink,
            ),
            AddTextField(
              label: 'Car Type',
              stream: _postAdBloc.carTypeStream,
              onChange: _postAdBloc.carTypeSink,
            ),
            AddTextField(
              label: 'Brand',
              stream: _postAdBloc.brandStream,
              onChange: _postAdBloc.brandSink,
            ),
            AddTextField(
              label: 'Desciption',
              stream: _postAdBloc.descriptionStream,
              onChange: _postAdBloc.descriptionSink,
              maxLine: 3,
            ),
          ],
        ),
      ),
    );
  }
}
