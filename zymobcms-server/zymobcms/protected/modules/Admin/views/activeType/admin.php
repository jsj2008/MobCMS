<?php
$this->breadcrumbs=array(
	'Active Types'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List ActiveType','url'=>array('index')),
	array('label'=>'Create ActiveType','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('active-type-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Active Types</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'active-type-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'type_name',
		'type_point',
		'create_user',
		'create_time',
		'status',
		/*
		'relation_table',
<<<<<<< HEAD
		'can_show_detail',
=======
>>>>>>> 9e438a74f5629d8503d3b4d558d27a1975878cdd
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>
