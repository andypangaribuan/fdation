/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

typedef NetResponseWhenCallback<T, R> = Future<R> Function(T response, Object err, StackTrace stackTrace);
