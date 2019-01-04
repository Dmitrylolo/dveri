<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<table class="reivew-comment">
	<tr class="name">
		<td style="width: 50%;"><strong><?php echo $review['author']; ?></strong></td>
		<td class="text-right">
			<span class="review-stars">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($review['rating'] < $i) { ?>
				<i class="fa fa-star-o"></i>
				<?php } else { ?>
				<i class="fa fa-star"></i>
				<?php } ?>
				<?php } ?>	
			</span>
			<?php echo $review['date_added']; ?>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="comment-txt"><p><?php echo $review['text']; ?></p></td>
	</tr>
</table>
<?php } ?>
<?php if ($pagination) { ?>
<div class="pagination-wrp"><?php echo $pagination; ?></div>	
<?php } ?>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
