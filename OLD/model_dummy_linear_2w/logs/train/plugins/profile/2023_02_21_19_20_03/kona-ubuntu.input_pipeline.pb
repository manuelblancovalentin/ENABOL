	����?����?!����?	�//L�4@�//L�4@!�//L�4@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$����?�(]����?A;����?Y����޸?*	B�l��Y^@2F
Iterator::Model��bg
�?!�&��	jK@)�s�v�4�?1�&���A@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap.u�׃I�?!�7���;@)�XQ�i�?1kL�gA58@:Preprocessing2U
Iterator::Model::ParallelMapV2w�^�"��?!��c���4@)w�^�"��?1��c���4@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat�el�f�?!�r�1k�*@)v�U�0��?1�vm�5K&@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip,����?!^�7��F@)�xy:Wt?1�ow��\@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice�F>�x�q?!̈v+��@)�F>�x�q?1̈v+��@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorG6ue?!��5�� @)G6ue?1��5�� @:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
host�Your program is HIGHLY input-bound because 20.7% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*moderate2t11.1 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9�//L�4@I�:���S@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�(]����?�(]����?!�(]����?      ��!       "      ��!       *      ��!       2	;����?;����?!;����?:      ��!       B      ��!       J	����޸?����޸?!����޸?R      ��!       Z	����޸?����޸?!����޸?b      ��!       JCPU_ONLYY�//L�4@b q�:���S@