	>"�D��?>"�D��?!>"�D��?	�v�1@�v�1@!�v�1@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$>"�D��?���T��?Am������?Yn���+�?*	��x�&!Z@2F
Iterator::Model�5|�?!NLi�L@)'M��y �?1.A͜�A@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap��A|`ǟ?!0�N;G�=@)ƈD�e�?1�T
�w;@:Preprocessing2U
Iterator::Model::ParallelMapV2;oc�#՗?!��^�D6@);oc�#՗?1��^�D6@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatW������?!fUm{\#@)��y���?1_��e� @:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip��z�V��?!���E@)j�drjgh?1�%^�C�@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice��ƽ�c?!��$Һ�@)��ƽ�c?1��$Һ�@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor{��X?!xe�Ү��?){��X?1xe�Ү��?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 17.5% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2t10.0 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9�v�1@IC�;{��T@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	���T��?���T��?!���T��?      ��!       "      ��!       *      ��!       2	m������?m������?!m������?:      ��!       B      ��!       J	n���+�?n���+�?!n���+�?R      ��!       Z	n���+�?n���+�?!n���+�?b      ��!       JCPU_ONLYY�v�1@b qC�;{��T@