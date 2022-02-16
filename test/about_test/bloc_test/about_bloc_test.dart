import 'package:portfolio_web/about/bloc/about_bloc.dart';
import 'package:portfolio_web/about/data_layer/about_data_layer.dart';
import 'package:portfolio_web/about/data_layer/models/about_data_model.dart';
import 'package:portfolio_web/about/repository_layer/about_repo_layer.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('aboutBloc', () {
    AboutBloc? aboutBloc;
    AboutDataLayer aboutDataLayer = AboutDataLayer();
    AboutRepoLayer aboutRepoLayer =
        AboutRepoLayer(aboutDataLayer: aboutDataLayer);

    setUp(() {
      aboutBloc = AboutBloc(aboutRepoLayer);
    });

    test('initial state is 0', () {
      expect(aboutBloc!.state, 0);
    });
  });
}