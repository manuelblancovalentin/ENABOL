	n�8)�{�?n�8)�{�?!n�8)�{�?	#Q=�7/@#Q=�7/@!#Q=�7/@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$n�8)�{�?V)=�K��?A��+�,�?Yn���V�?*	��Q��Y@2F
Iterator::Model��Z���?!<����bF@)�JxB�?�?1����7@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap��A�p�?!�E@�U<@)��q�@�?1Nh�G0�6@:Preprocessing2U
Iterator::Model::ParallelMapV2\�=��?!�0�O�4@)\�=��?1�0�O�4@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatoض(�A�?!���5@)�� ��F�?1�@ �]0@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip�QcB�%�?!�nUd.�K@))�7Ӆx?1���=�;@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[1]::TensorSlice�C��<�v?!�v熒m@)�C��<�v?1�v熒m@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor
�F�s?!d�m���@)
�F�s?1d�m���@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 15.6% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2t12.1 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9"Q=�7/@I��U8U@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	V)=�K��?V)=�K��?!V)=�K��?      ��!       "      ��!       *      ��!       2	��+�,�?��+�,�?!��+�,�?:      ��!       B      ��!       J	n���V�?n���V�?!n���V�?R      ��!       Z	n���V�?n���V�?!n���V�?b      ��!       JCPU_ONLYY"Q=�7/@b q��U8U@