import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_manager_state.dart';

class SearchManagerCubit extends Cubit<SearchManagerState> {
  SearchManagerCubit() : super(SearchManagerInitial());
  searchWord(String word)=>emit(SearchWordState(word: word));
  static searchWordEvent({required BuildContext context,required String word})=>BlocProvider.of<SearchManagerCubit>(context).searchWord(word);
}
