import 'package:expense_tracker/Models/item_model.dart';
import 'package:expense_tracker/View/main_screen_widgets/item_cards.dart';
import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final ItemModel itemModel;
  final VoidCallback onDelete;
  const SlideAnimation({
    super.key,
    required this.itemModel,
    required this.onDelete,
  });

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  double offSetX = 0;
  void deletingAnimaion() async {
    setState(() {
      offSetX = -400;
    });
    await Future.delayed(Duration(milliseconds: 400));

    widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: deletingAnimaion,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(offSetX, 0, 0),
        child: ItemCards(
          category: widget.itemModel.category,
          name: widget.itemModel.name,
          price: widget.itemModel.price,
        ),
      ),
    );
  }
}
