	�,C���?�,C���?!�,C���?	,�l��"4@,�l��"4@!,�l��"4@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�,C���?�a����?AjO�9���?Y$D���?*	F����p]@2F
Iterator::Model���F�?!s��=�L@)��ZӼ�?1T�m�RA@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap�x����?!�)��-<@)X���ޝ?1��Ɏ$�8@:Preprocessing2U
Iterator::Model::ParallelMapV2�k%t�ę?!=��K^5@)�k%t�ę?1=��K^5@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatHp#e���?!f0�(@)d��u�?1���f%@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip�V�f��?!�Gz�.�E@)V��L�p?1in��&@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice'0��mp?!�)�vy?@)'0��mp?1�)�vy?@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensore�fb�`?!��m��?)e�fb�`?1��m��?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
host�Your program is HIGHLY input-bound because 20.1% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*moderate2s7.8 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9,�l��"4@I�ؤZ�S@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�a����?�a����?!�a����?      ��!       "      ��!       *      ��!       2	jO�9���?jO�9���?!jO�9���?:      ��!       B      ��!       J	$D���?$D���?!$D���?R      ��!       Z	$D���?$D���?!$D���?b      ��!       JCPU_ONLYY,�l��"4@b q�ؤZ�S@