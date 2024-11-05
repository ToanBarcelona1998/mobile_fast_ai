extension IntFormat on int{
  String get formatCount{
    if(this == 0) return toString();
    if(this < 1000){
      return toString().replaceAll(RegExp(r'0*$'), '');
    }

    if(this < 1000000){
      return '${(this/1000).toStringAsFixed(2).replaceAll(RegExp(r'0*$'), '')}K';
    }

    return '${(this/1000000).toStringAsFixed(2).replaceAll(RegExp(r'0*$'), '')}M';
  }
}