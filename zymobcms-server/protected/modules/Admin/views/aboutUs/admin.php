<?php
/* @var $this AboutUsController */
/* @var $model AboutUs */

$this->breadcrumbs=array(
	'About Uses'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List AboutUs', 'url'=>array('index')),
	array('label'=>'Create AboutUs', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#about-us-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage About Uses</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'about-us-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'content',
		'phone',
		'website',
		'email',
		'qq',
		/*
		'msn',
		'home_phone',
		'copy_right',
		'company_name',
		'blog_host',
		'contact_who',
		'status',
		'product_name',
		'logo_image',
		'update_time',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
